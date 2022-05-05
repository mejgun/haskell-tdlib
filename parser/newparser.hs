#!/usr/bin/env stack
-- stack --resolver lts-18.28 script

{-# LANGUAGE OverloadedStrings #-}

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
  let dat = filter (not . null) . map strip $ LE.splitOn "\n" d
  let a0 =
        map fixConstructors
          . filter (not . isJunk)
          $ foldl parse [] dat
  -- let b = foldr structureData (Nothing, []) a
  -- let a1 = foldl addGeneralResult [] a0
  -- let a = fixArgsKeys a0 []
  let (import', b) = foldl fixArgTypes ([], []) a0
  let imports = uniq import'
  let (Nothing, Nothing, c) = foldl insertComments (Nothing, Nothing, []) b
  let c1 = foldl groupDataItems [] c
  let d = map fixArgsKeys c1
  mapM_ print imports
  writeData imports d
  writeGeneralResult d

dataFileMask :: String
dataFileMask = "../src/TD/Reply/%s.hs"

dataModule :: String
dataModule = "TD.Reply"

writeGeneralResult :: [GroupedItems] -> IO ()
writeGeneralResult l =
  writeFile (printf dataFileMask name) content
  where
    name :: String
    name = "GeneralResult"
    content =
      L.intercalate
        "\n"
        [ "{-# LANGUAGE OverloadedStrings #-}",
          "",
          printf "module %s.%s where" dataModule name,
          "",
          L.intercalate "\n" (map (\(a, _, _) -> printf "import qualified %s.%s as %s" dataModule a a) l),
          "",
          "data GeneralResult",
          " = " ++ L.intercalate "\n | " (map (\(a, _, _) -> printf "%s %s.%s" a a a) l),
          "data ResultWithExtra = ResultWithExtra GeneralResult (Maybe String) deriving (Show, Eq)",
          "",
          "instance T.FromJSON ResultWithExtra where",
          "parseJSON v@(T.Object obj) = do",
          "case (T.fromJSON v :: T.Result GeneralResult) of",
          "  T.Success a -> return $ ResultWithExtra a e",
          "  _           -> mempty",
          "where",
          " e :: Maybe String",
          " e = case T.parse (\\o -> o A..:? \"@extra\" :: T.Parser (Maybe String)) obj of",
          "   T.Success r -> r",
          "   _           -> Nothing"
        ]

writeData :: [ImportRecord] -> [GroupedItems] -> IO ()
writeData _ [] = print "done"
writeData imps (q@(n, com, is) : t) = do
  writeFile fileName fileContent
  writeData imps t
  where
    fileName :: FilePath
    fileName = printf dataFileMask n
    fileContent :: String
    fileContent = formatDataItem (filter (\i -> fst i == n) imps) q

formatDataItem :: [ImportRecord] -> GroupedItems -> String
formatDataItem imps (n, cm, is) =
  L.intercalate
    "\n"
    [ "{-# LANGUAGE OverloadedStrings #-}",
      "",
      printf "module %s.%s where" dataModule n,
      "",
      L.intercalate "\n" (map (\(_, a) -> printf "import qualified %s.%s as %s" dataModule a a) imps),
      "",
      case cm of
        Nothing -> ""
        Just c -> do
          printf "-- | %s" (comment c),
      printf "data %s =" n,
      L.intercalate " |\n" (map printDataType is)
    ]
  where
    printDataType :: Entry -> String
    printDataType (Item cl con com arg) = do
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

addGeneralResult :: [Entry] -> Entry -> [Entry]
addGeneralResult acc q@(Item cl con com arg) =
  let g = Item {constructor = cl, class_ = "GeneralResult", comments = [], args = []}
   in if g `elem` acc then acc ++ [q] else acc ++ [q, g]
addGeneralResult acc q = acc ++ [q]

groupDataItems :: [GroupedItems] -> Entry -> [GroupedItems]
groupDataItems list q@(ClassComment n c) =
  case filter (\(name, _, _) -> name == n) list of
    [] -> list ++ [(n, Just q, [])]
    _ -> error "grouping error"
groupDataItems list q@(Item cl con com arg) = do
  case filter (\(name, _, _) -> name == cl) list of
    [] -> list ++ [(cl, Nothing, [q])]
    [(x0, x1, x2)] -> filter (\(name, _, _) -> name /= cl) list ++ [(x0, x1, x2 ++ [q])]
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
      | k `elem` ["type", "data", "id"] = let newk = add k in fix keys q {key = newk}
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

fixArgTypes :: ([ImportRecord], [Entry]) -> Entry -> ([ImportRecord], [Entry])
fixArgTypes (imp, acc) i@(Item cl c com arg) = do
  let (imports, newarg) = foldl fix ([], []) arg
  (imp ++ zip (repeat cl) imports, acc ++ [i {args = newarg}])
  where
    fix :: ([String], [Arg]) -> Arg -> ([String], [Arg])
    fix (i, a) r@(Arg _ v _) = do
      let (addi, newv) = case replace v of
            (False, p) -> ([], p)
            (True, p) -> do
              if LE.isPrefixOf "vector<" p
                then do
                  let m = dropAround (== '>') $ myStripPrefix "vector<" p
                  case replace m of
                    (False, w) -> ([], printf "[%s]" w)
                    (True, w) -> let im = toTitle w in ([im], printf "[%s.%s]" im im)
                else do
                  let m = toTitle p
                  ([m], printf "%s.%s" m m)
      (i ++ addi, a ++ [r {value = newv}])
    replace :: String -> (Bool, String)
    replace "Bool" = (False, "Bool")
    replace "int32" = (False, "Int")
    replace "int53" = (False, "Int")
    replace "int64" = (False, "Int")
    replace "string" = (False, "String")
    replace "bytes" = (False, "String")
    replace "double" = (False, "Float")
    replace p = (True, p)
fixArgTypes (imp, acc) o = (imp, acc ++ [o])

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
insertComments (it, a, acc) q@(Item cl con com arg) = do
  let i = case it of
        Nothing -> q
        Just i -> i
  let i1 = case a of
        Nothing -> i
        Just ar -> i {args = args i ++ [ar]}
  let i2 = i1 {args = map (insertArgComment (args i1)) arg, constructor = con, class_ = cl, comments = comments i1}
  (Nothing, Nothing, acc ++ [i2])
  where
    insertArgComment :: [Arg] -> Arg -> Arg
    insertArgComment as a = do
      case filter (\x -> key a == key x) as of
        [] -> a
        [arg'] -> a {comments_ = comments_ arg'}
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
    let (name, rest) = LE.breakOn " " $ myStripPrefix "//@class " h
    acc ++ [ClassComment {name = name, comment = myStripPrefix " @description " rest}]
  | "//@description " `L.isPrefixOf` h =
    acc ++ [CommentStart (myStripPrefix "//@description " h)]
  | "//@" `L.isPrefixOf` h = do
    let (name, rest) = LE.breakOn " " $ myStripPrefix "//@" h
    acc ++ [ArgComment {name = name, comment = myStripPrefix " " rest}]
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
