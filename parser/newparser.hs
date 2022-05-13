#!/usr/bin/env stack
-- stack --resolver lts-18.28 script

{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -W -Wall -Werror #-}

module Main where

-- import qualified Debug.Trace as Debug (trace, traceId)

import Data.Char (isSpace)
import qualified Data.Char as C
import qualified Data.List as L
import qualified Data.List.Extra as LE
import Text.Printf (printf)

data Entry
  = ClassComment
      { name :: String,
        comment :: String
      }
  | CommentStart String
  | Comment String
  | ArgComment
      { name :: String,
        comment :: String
      }
  | Item
      { class_ :: String,
        constructor :: String,
        comments :: [String],
        args :: [Arg]
      }
  deriving (Show, Eq)

data Arg = Arg
  { key :: String,
    value :: String,
    comments_ :: [String]
  }
  deriving (Show, Eq)

type GroupedItems = (String, Maybe Entry, [Entry])

type ImportRecord = (String, String)

main :: IO ()
main = do
  [d, f] <- LE.splitOn "---functions---" <$> readFile "td_api.tl"
  let dt = filter (not . null) . map strip $ LE.splitOn "\n" d
  let a0 =
        map fixConstructors
          . filter (not . isJunk)
          $ foldl parse [] dt
  let fun = filter (not . null) . map strip $ LE.splitOn "\n" f
  let f0 = map fixConstructors $ foldl parse [] fun
  -- let b = foldr structureData (Nothing, []) a
  -- let a1 = foldl addGeneralResult [] a0
  -- let a = fixArgsKeys a0 []
  let (import', b) = foldl (fixArgTypes True) ([], []) a0
  let (importFun', f1) = foldl (fixArgTypes False) ([], []) f0
  -- let imports = uniq import'
  let recImports' = uniq . findRecursiions $ uniq import'
  let (okImports, recurImports) = sortImports import' recImports'
  let (Nothing, Nothing, c) = foldl insertComments (Nothing, Nothing, []) b
  let (Nothing, Nothing, f2) = foldl insertComments (Nothing, Nothing, []) f1
  let c1 = foldl groupDataItems [] c
  let dat = map fixArgsKeys c1
  let f3 = concatMap ((\(_, _, x) -> x) . fixArgsKeys . (\x -> ("a", [], [x]))) f2
  mapM_ print importFun'
  mapM_ print f3
  writeData okImports recurImports dat
  writeFuncs importFun' f3
  writeGeneralResult dat
  writeDataBoot recImports'

dataFileMask :: String
dataFileMask = "../src/TD/Data/%s.hs"

funcFileMask :: String
funcFileMask = "../src/TD/Query/%s.hs"

dataBootFileMask :: String
dataBootFileMask = "../src/TD/Data/%s.hs-boot"

dataModule :: String
dataModule = "TD.Data"

funcModule :: String
funcModule = "TD.Query"

writeGeneralResult :: [GroupedItems] -> IO ()
writeGeneralResult l =
  writeFile (printf dataFileMask modname) content
  where
    modname :: String
    modname = "GeneralResult"
    content =
      L.intercalate
        "\n"
        [ "{-# LANGUAGE OverloadedStrings #-}",
          "",
          "-- |",
          printf "module %s.%s where" dataModule modname,
          "",
          "import qualified Data.Aeson as A",
          "import qualified Data.Aeson.Types as T",
          L.intercalate "\n" (map (\(a, _, _) -> printf "import qualified %s.%s as %s" dataModule a a) l),
          "",
          "data GeneralResult",
          " = " ++ L.intercalate "\n | " (map (\(a, _, _) -> printf "%s %s.%s" a a a) l),
          "      deriving (Show, Eq)",
          "data ResultWithExtra = ResultWithExtra GeneralResult (Maybe String) deriving (Show, Eq)",
          "",
          "instance T.FromJSON ResultWithExtra where",
          " parseJSON v@(T.Object obj) = do",
          "  case (T.fromJSON v :: T.Result GeneralResult) of",
          "   T.Success a -> return $ ResultWithExtra a e",
          "   _           -> mempty",
          "  where",
          "   e :: Maybe String",
          "   e = case T.parse (\\o -> o A..:? \"@extra\" :: T.Parser (Maybe String)) obj of",
          "     T.Success r -> r",
          "     _           -> Nothing",
          " parseJSON _ = mempty",
          "",
          "instance T.FromJSON GeneralResult where",
          " parseJSON v@(T.Object _) = do",
          "  mconcat t",
          "  where",
          "   t =",
          "     [",
          L.intercalate
            ",\n"
            ( map
                ( \(a, _, _) ->
                    concat
                      [ printf "      case (T.fromJSON v :: T.Result %s.%s) of\n" a a,
                        printf "       T.Success a -> return $ %s a\n" a,
                        printf "       _ -> mempty"
                      ]
                )
                l
            ),
          "     ]",
          " parseJSON _ = mempty"
        ]

writeFuncs :: [ImportRecord] -> [Entry] -> IO ()
writeFuncs _ [] = putStrLn "done"
writeFuncs imps (q@(Item _ con com arg) : t) = do
  writeFile fileName fileContent
  writeFuncs imps t
  where
    fileName :: FilePath
    fileName = printf funcFileMask con

    fileContent :: String
    fileContent = formatFuncItem (filter (\(i, _) -> i == con) imps)

    formatFuncItem :: [ImportRecord] -> String
    formatFuncItem imp =
      L.intercalate
        "\n"
        [ "{-# LANGUAGE OverloadedStrings #-}\n",
          "",
          "-- |",
          printf "module %s.%s where" funcModule con,
          "import qualified Utils as U",
          "import qualified Data.Aeson as A",
          "import qualified Data.Aeson.Types as T",
          L.intercalate "\n" (map (\(_, i) -> printf "import qualified %s.%s as %s" dataModule i i) imp),
          "",
          "-- |",
          L.intercalate "\n" (map (printf "-- %s") com),
          printf "data %s = %s" con con,
          "  {",
          L.intercalate ",\n" (map printDataType arg),
          "  }",
          "  deriving (Eq)",
          "",
          printf "instance Show %s where" con,
          printToShow q,
          "",
          printf "instance T.ToJSON %s where" con,
          printToJson q
        ]
      where
        printDataType :: Arg -> String
        printDataType (Arg k v comms) = do
          L.concat
            [ "   -- | ",
              L.intercalate "\n   -- " comms,
              printf "\n   %s :: %s" k v
            ]
writeFuncs _ _ = error "func write error"

printToShow :: Entry -> String
printToShow (Item _ con _ arg) =
  L.intercalate
    "\n\n"
    [ printf " show %s %s" con (if null arg then "" else "{" :: String),
      L.intercalate
        ",\n"
        ( map (\(Arg x1 _ _) -> printf "   %s = %s_" x1 x1) arg
        ),
      printf "   %s" (if null arg then "" else "}" :: String),
      printf "   = \"%s\" ++ U.cc [" con,
      L.intercalate
        ",\n"
        ( map (\(Arg x1 _ _) -> printf "   U.p \"%s\" %s_" x1 x1) arg
        ),
      "  ]"
    ]
printToShow _ = error "not item"

printToJson :: Entry -> String
printToJson (Item _ con _ arg) =
  L.intercalate
    "\n\n"
    [ printf " toJSON %s %s" con (if null arg then "" else "{" :: String),
      L.intercalate
        ",\n"
        ( map (\(Arg x1 _ _) -> printf "   %s = %s_" x1 x1) arg
        ),
      printf "   %s" (if null arg then "" else "}" :: String),
      printf "   = A.object [",
      printf "   \"@type\" A..= T.String \"%s\"%s" (toLower con) (if null arg then "" else "," :: String),
      L.intercalate
        ",\n"
        ( map (\(Arg x1 _ _) -> printf "   \"%s\" A..= %s_" (dropAround (== '_') x1) x1) arg
        ),
      "  ]"
    ]
printToJson _ = error "not item"

writeData :: [ImportRecord] -> [ImportRecord] -> [GroupedItems] -> IO ()
writeData _ _ [] = putStrLn "done"
writeData imps recimps (q@(nam, _, _) : t) = do
  writeFile fileName fileContent
  writeData imps recimps t
  where
    fileName :: FilePath
    fileName = printf dataFileMask nam

    fileContent :: String
    fileContent = formatDataItem (filter (\i -> fst i == nam) imps) (filter (\i -> fst i == nam) recimps) q

    formatDataItem :: [ImportRecord] -> [ImportRecord] -> GroupedItems -> String
    formatDataItem ims recs (n, cm, is) =
      L.intercalate
        "\n"
        [ "{-# LANGUAGE OverloadedStrings #-}",
          "",
          " -- |",
          printf "module %s.%s where" dataModule n,
          "",
          "import qualified Utils as U",
          "import qualified Data.Aeson as A",
          "import qualified Data.Aeson.Types as T",
          L.intercalate "\n" (map (\(_, a) -> printf "import qualified %s.%s as %s" dataModule a a) ims),
          L.intercalate "\n" (map (\(_, a) -> printf "import {-# SOURCE #-} qualified %s.%s as %s" dataModule a a) recs),
          "",
          case cm of
            Nothing -> ""
            Just c -> do
              printf "-- | %s" (comment c),
          printf "data %s =" n,
          L.intercalate " |\n" (map printDataType is),
          "  deriving (Eq)",
          "",
          printf "instance Show %s where" n,
          L.intercalate "\n" (map printToShow is),
          printFromJson,
          printf "instance T.ToJSON %s where" n,
          L.intercalate "\n" (map printToJson is)
        ]
      where
        printDataType :: Entry -> String
        printDataType (Item _ con com arg) = do
          L.concat
            [ " -- | ",
              L.intercalate "\n -- " com,
              printf "\n %s" con,
              case arg of
                [] -> ""
                x -> "\n  {" ++ L.intercalate "," (map printArg x) ++ "\n  }"
            ]
        printDataType _ = error "error"
        printArg :: Arg -> String
        printArg a =
          "\n    -- | "
            ++ L.intercalate "\n    -- " (comments_ a)
            ++ printf "\n    %s :: %s" (key a) (value a)
        printFromJson :: String
        printFromJson =
          L.intercalate
            "\n\n"
            ( [ printf "\ninstance T.FromJSON %s" n,
                " where",
                " parseJSON v@(T.Object obj) = do",
                "  t <- obj A..: \"@type\" :: T.Parser String",
                "  case t of"
              ]
                ++ map
                  ( \x ->
                      let i = constructor x
                       in printf "   \"%s\" -> parse%s v" (toLower i) i
                  )
                  is
                ++ [ "   _ -> mempty",
                     "  where"
                   ]
                ++ map printFromJsonItem is
                ++ [" parseJSON _ = mempty"]
            )
        printFromJsonItem :: Entry -> String
        printFromJsonItem (Item cl con _ []) =
          L.intercalate
            "\n"
            [ printf "   parse%s :: A.Value -> T.Parser %s" con cl,
              printf "   parse%s = A.withObject \"%s\" $ \\_ -> return %s" con con con
            ]
        printFromJsonItem (Item cl con _ ar) =
          L.intercalate
            "\n"
            ( [ printf "   parse%s :: A.Value -> T.Parser %s" con cl,
                printf "   parse%s = A.withObject \"%s\" $ \\o -> do" con con
              ]
                ++ map printFromJsonArg ar
                ++ [ printf
                       "    return $ %s { %s }"
                       con
                       ( L.intercalate ", " (map (\x -> printf "%s = %s_" (key x) (key x)) ar)
                       ),
                     ""
                   ]
            )
        printFromJsonItem _ = error "oops"
        printFromJsonArg :: Arg -> String
        printFromJsonArg (Arg k "Maybe Int" _) = printf "    %s_ <- mconcat [o A..:? \"%s\", U.rm <$> (o A..: \"%s\" :: T.Parser String)] :: T.Parser (Maybe Int)" k (dropAround (== '_') k) (dropAround (== '_') k)
        printFromJsonArg (Arg k _ _) = printf "    %s_ <- o A..:? \"%s\"" k (dropAround (== '_') k)

writeDataBoot :: [ImportRecord] -> IO ()
writeDataBoot [] = putStrLn "done"
writeDataBoot ((_, h) : t) = do
  writeFile fileName fileContent
  writeDataBoot t
  where
    fileName :: FilePath
    fileName = printf dataBootFileMask h
    fileContent :: String
    fileContent =
      L.intercalate
        "\n"
        [ printf "module %s.%s where" dataModule h,
          "",
          "import Data.Aeson.Types ( FromJSON, ToJSON )",
          "",
          printf "data %s" h,
          "",
          printf "instance Eq %s" h,
          "",
          printf "instance Show %s" h,
          "",
          printf "instance FromJSON %s" h,
          "",
          printf "instance ToJSON %s" h
        ]

-- addGeneralResult :: [Entry] -> Entry -> [Entry]
-- addGeneralResult acc q@(Item cl con com arg) =
--   let g = Item {constructor = cl, class_ = "GeneralResult", comments = [], args = []}
--    in if g `elem` acc then acc ++ [q] else acc ++ [q, g]
-- addGeneralResult acc q = acc ++ [q]

sortImports :: [ImportRecord] -> [ImportRecord] -> ([ImportRecord], [ImportRecord])
sortImports alli recs = do
  -- let a = filter (\(x, y) -> x /= y) all
  let ok = filter (`notElem` recs) alli
      re = filter (`elem` recs) alli
  (uniq ok, uniq re)

findRecursiions :: [ImportRecord] -> [ImportRecord]
findRecursiions m = foldl (findr m) [] m
  where
    findr :: [ImportRecord] -> [ImportRecord] -> ImportRecord -> [ImportRecord]
    findr list acc need@(_, x2) =
      let a = filter (\(x, _) -> x == x2) list
       in acc ++ concatMap (\item -> finditem (list L.\\ a) [] item need) a

    finditem :: [ImportRecord] -> [ImportRecord] -> ImportRecord -> ImportRecord -> [ImportRecord]
    finditem list acc cur@(_, b) need@(x, y)
      | b == x = acc ++ [cur]
      | otherwise =
        let a = filter (\(x1, _) -> x1 == b) list
         in acc ++ case a of
              [] -> []
              [(x1, _)] | x1 == y -> [cur]
              z -> case concatMap (\item -> finditem (list L.\\ a) [] item need) z of
                [] -> []
                w -> w ++ [cur]

groupDataItems :: [GroupedItems] -> Entry -> [GroupedItems]
groupDataItems list q@(ClassComment n _) =
  case filter (\(nam, _, _) -> nam == n) list of
    [] -> list ++ [(n, Just q, [])]
    _ -> error "grouping error"
groupDataItems list q@(Item cl _ _ _) = do
  case filter (\(nam, _, _) -> nam == cl) list of
    [] -> list ++ [(cl, Nothing, [q])]
    [(x0, x1, x2)] -> filter (\(nm, _, _) -> nm /= cl) list ++ [(x0, x1, x2 ++ [q])]
    _ -> error "grouping error"
groupDataItems _ _ = error "grouping error"

fixConstructors :: Entry -> Entry
fixConstructors (Item cl c com arg) = Item {class_ = cl, constructor = toTitle c, comments = com, args = arg}
fixConstructors q = q

fixArgsKeys :: (String, b, [Entry]) -> (String, b, [Entry])
fixArgsKeys (nm, b, l) = let (_, _, ll) = foldl fixAll ([], [], []) l in (nm, b, ll)
  where
    -- fixArgsKeys (q@(Item cl _ _ arg) : t) acc = fixArgsKeys t acc ++ [q {args = map fix arg}]

    fixAll :: ([(String, String)], [Arg], [Entry]) -> Entry -> ([(String, String)], [Arg], [Entry])
    fixAll (keys, ar, acc) q@(Item _ _ _ (h : t)) =
      let (k, a) = fix keys h in fixAll (k, a : ar, acc) (q {args = t}) -- (k, acc ++ [q {args = a}])
    fixAll (keys, ar, acc) q@(Item _ _ _ []) =
      (keys, [], acc ++ [q {args = ar}]) -- (k, acc ++ [q {args = a}])
    fixAll _ _ = error "could not be"
    fix :: [(String, String)] -> Arg -> ([(String, String)], Arg)
    fix keys q@(Arg k v _)
      | k `elem` ["type", "data", "id", "length", "error", "filter"] =
        let newk = add k
         in fix keys q {key = newk}
      | (k, v) `elem` keys = (keys ++ [(k, v)], q)
      | k `elem` map fst keys = let newk = add k in fix keys (q {key = newk})
      | otherwise = (keys ++ [(k, v)], q)
    add :: String -> String
    add a = "_" ++ a

-- filterSameClass :: [Entry] -> [Arg]
-- filterSameClass acc =
--   foldl
--     ( \ak a -> case a of
--         (Item c _ _ arg) -> if c == nm then ak ++ arg else ak
--         _ -> ak
--     )
--     []
--     acc

-- fixArgsKeys (h : t) acc = fixArgsKeys t (acc ++ [h])

fixArgTypes :: Bool -> ([ImportRecord], [Entry]) -> Entry -> ([ImportRecord], [Entry])
fixArgTypes pr (imp, acc) i@(Item cl c _ arg) =
  let (imports, newarg) = foldl fix ([], []) arg
   in (imp ++ zip (repeat (if pr then cl else c)) imports, acc ++ [i {args = newarg}])
  where
    fix :: ([String], [Arg]) -> Arg -> ([String], [Arg])
    fix (ii, a) r@(Arg _ v _) =
      let (addi, newv) = case replace v of
            (False, p) -> ([], p)
            (True, p) -> vectorCheck p
       in (ii ++ addi, a ++ [r {value = printf "Maybe %s" newv}])
    vectorCheck :: String -> ([String], String)
    vectorCheck p =
      if LE.isPrefixOf "vector<" p
        then
          let m = dropAround (== '>') $ myStripPrefix "vector<" p
           in case replace m of
                (False, w) -> ([], printf "[%s]" w)
                (True, w) -> let (im, mm) = vectorCheck w in (im, printf "[%s]" mm) -- toTitle w in ([im], printf "[%s.%s]" im im)
        else
          let m = toTitle p
           in if (pr && cl == m) || (not pr && c == m) then ([], m) else ([m], printf "%s.%s" m m)
    replace :: String -> (Bool, String)
    replace "Bool" = (False, "Bool")
    replace "int32" = (False, "Int")
    replace "int53" = (False, "Int")
    replace "int64" = (False, "Int")
    replace "string" = (False, "String")
    replace "bytes" = (False, "String")
    replace "double" = (False, "Float")
    replace x = (True, x)
fixArgTypes _ (imp, acc) o = (imp, acc ++ [o])

insertComments :: (Maybe Entry, Maybe Arg, [Entry]) -> Entry -> (Maybe Entry, Maybe Arg, [Entry])
insertComments (Nothing, Nothing, acc) q@(ClassComment _ _) =
  (Nothing, Nothing, acc ++ [q])
insertComments (Nothing, Nothing, acc) (CommentStart t) =
  (Just Item {comments = [t], constructor = "", args = [], class_ = ""}, Nothing, acc)
insertComments (Just item, Nothing, acc) (Comment t) =
  (Just Item {comments = comments item ++ [t], constructor = "", args = [], class_ = ""}, Nothing, acc)
insertComments (q@(Just _), Just arg, acc) (Comment t) =
  (q, Just Arg {comments_ = comments_ arg ++ [t], key = key arg, value = ""}, acc)
insertComments (q@(Just _), Nothing, acc) (ArgComment n c) =
  (q, Just Arg {comments_ = [c], key = n, value = ""}, acc)
insertComments (Just i, Just arg, acc) (ArgComment n c) =
  (Just (i {args = args i ++ [arg]}), Just Arg {comments_ = [c], key = n, value = ""}, acc)
insertComments (it, a, acc) q@(Item cl con _ arg) = do
  let i = case it of
        Nothing -> q
        Just ii -> ii
  let i1 = case a of
        Nothing -> i
        Just ar -> i {args = args i ++ [ar]}
  let i2 = i1 {args = map (insertArgComment (args i1)) arg, constructor = con, class_ = cl, comments = comments i1}
  (Nothing, Nothing, acc ++ [i2])
  where
    insertArgComment :: [Arg] -> Arg -> Arg
    insertArgComment as aa = do
      case filter (\x -> key aa == key x) as of
        [] -> aa
        [arg'] -> aa {comments_ = comments_ arg'}
        _ -> error "parse error"
insertComments _ _ = error "TL parse error"

{-
insertComments q@(cure, cura, acc) entry = do
  case entry of
    ClassComment txt txt' -> q
    CommentStart txt -> do
      let newacc = case cur of
            Nothing -> acc
            Just en -> acc ++ [en]
      (Just (Item "" "" [txt] []), newacc)
    Comment txt -> do
      let newcur = case cur of
            Nothing -> error "comment continues"
            Just en -> case en of
              Item _ _ cmnts [] -> en {comments = comments en ++ [txt]}
              Item _ _ _ ar -> en {args = map ()}
              _ -> error "wrong type"
      (Just newcur, acc)
    ArgComment txt txt' -> undefined
    Item txt txt' txts args -> undefined

-- case cur of
-- Nothing -> _
-- Just en -> _
-}
{-}
structureData :: Entry -> (Maybe StructuredClass, [StructuredClass]) -> (Maybe StructuredClass, [StructuredClass])
structureData (Item cl con com ar) (cur, acc) = do
  let newacc = case cur of
        Nothing -> acc
        Just sc -> if class_ sc == cl then acc ++ [sc]
  let newcur = SC {classname =cl,
                            classcomment =,
                            items :: [StructuredItem]}
  (Just newcur, newacc)
structureData (ClassComment txt txt') (cur, acc) = undefined
structureData (CommentStart txt) (cur, acc) = undefined
structureData (Comment txt) (cur, acc) = undefined
structureData (ArgComment txt txt') (cur, acc) = undefined
-}

parse :: [Entry] -> String -> [Entry]
parse acc h
  | "//@class " `L.isPrefixOf` h = do
    let (nam, rest) = LE.breakOn " " $ myStripPrefix "//@class " h
    acc ++ [ClassComment {name = nam, comment = myStripPrefix " @description " rest}]
  | "//@description " `L.isPrefixOf` h =
    acc ++ [CommentStart (myStripPrefix "//@description " h)]
  | "//@" `L.isPrefixOf` h = do
    let (nam, rest) = LE.breakOn " " $ myStripPrefix "//@" h
    acc ++ [ArgComment {name = nam, comment = myStripPrefix " " rest}]
  | "//-" `L.isPrefixOf` h = do
    acc ++ [Comment (myStripPrefix "//-" h)]
  | length (LE.splitOn " = " h) == 2 = do
    let (r, cl) = LE.breakOn " = " h
    let (constr, r2) = LE.breakOn " " r
    let a1 = case strip r2 of
          "" -> []
          x -> map (LE.breakOn ":") $ LE.splitOn " " x
    acc
      ++ [ Item
             { class_ = myStrip cl,
               constructor = myStrip constr,
               comments = [],
               args =
                 map
                   ( \(x, y) ->
                       Arg
                         { key = x,
                           value = myStrip y,
                           comments_ = []
                         }
                   )
                   a1
             }
         ]
  | otherwise = acc

uniq :: (Eq a) => [a] -> [a]
uniq = foldl (\acc i -> if i `elem` acc then acc else acc ++ [i]) []

toTitle :: String -> String
toTitle (x : xs) = C.toTitle x : xs
toTitle "" = ""

toLower :: String -> String
toLower (x : xs) = C.toLower x : xs
toLower "" = ""

dropAround :: (Char -> Bool) -> String -> String
dropAround p = LE.dropWhile p . LE.dropWhileEnd p

strip :: String -> String
strip = LE.dropWhile isSpace . LE.dropWhileEnd isSpace

myStripPrefix :: String -> String -> String
myStripPrefix w t = do
  case LE.stripPrefix w t of
    Nothing -> error $show t
    Just r -> r

myStrip :: String -> String
myStrip =
  strip
    . dropAround (== ':')
    . strip
    . dropAround (== '=')
    . strip
    . dropAround (== ';')
    . strip

isJunk :: Entry -> Bool
isJunk (Item x _ _ _) =
  x
    `elem` [ "Double",
             "String",
             "Int32",
             "Int53",
             "Int64",
             "Bytes",
             "Bool",
             "Bool",
             "Vector t",
             ""
           ]
isJunk _ = False

-- let datCmnts = getComments dat
-- print datCmnts

-- let a = splitToItems funcs
-- print $ itemToEntry $ a !! 3

-- getComments :: String -> [String]
-- getComments = map strip . filter (L.isPrefixOf "//") . map strip . LE.splitOn "\n"
-- where
-- strip s = do
-- let Just r = T.LE.stripPrefix "//" s
-- r

{-
splitToItems :: String -> [String]
splitToItems =
  filter (/= "")
    . map (strip . T.dropAround (== '\n') . strip)
    . LE.splitOn "\n//@description"

itemToEntry :: String -> Entry
itemToEntry x = do
  let splited = filter (/= "") . map strip $ LE.splitOn "\n" x
  let comments = head splited : map (T.dropWhile (== '/')) (filter (L.isPrefixOf "//") splited)
  let [dat] = filter (not . L.isPrefixOf "//") $ tail splited
  let (a, name) = LE.breakOn "=" dat
  let (constr, rest) = LE.breakOn " " a
  Entry
    { comments = takeWhile (not . L.isPrefixOf "@") comments,
      name = myStrip name,
      constructor = myStrip constr,
      args = []
    }

-}

-- -- | convert "chatPhoto small:file big:file = ChatPhoto;" to
-- -- map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
-- --
-- -- map(data type name)=[(data type contructor), (string)]
-- -- toMap :: [String] -> Map.Map String [(String, String)]
-- toMap :: [String] -> [Entry]
-- toMap t =
--   -- foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $
--   -- map format t
--   -- format l
--   -- where
--   -- format l = do
--   do
--     let comments = filter (L.isPrefixOf "//") t
--     let (dat : _) = filter (== T.empty) . filter (not . L.isPrefixOf "//") $t
--     let (a, name) = LE.breakOn "=" dat
--     let (constr, rest) = LE.breakOn " " a

{-
     user_ids <-
          mconcat
            [ o A..:? "user_ids",
              do
                t0 <- o A..: "user_ids" :: T.Parser String
                let t1 = read t0 :: [String]
                let t2 = map read t1
                return $ Just t2
            ] ::
            T.Parser (Maybe [Int])

          -}