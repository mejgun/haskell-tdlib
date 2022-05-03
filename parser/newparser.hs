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

main :: IO ()
main = do
  [d, f] <- LE.splitOn "---functions---" <$> readFile "td_api.tl"
  let dat = filter (not . null) . map strip $ LE.splitOn "\n" d
  let a = map fixConstructors . filter (not . isJunk) $ foldl parse [] dat
  -- let b = foldr structureData (Nothing, []) a
  let (Nothing, Nothing, b) = foldl insertComments (Nothing, Nothing, []) a
  let c = foldl groupDataItems [] b
  mapM_ print c
  writeData c

dataFile :: String
dataFile = "TD/Reply/%s.hs"

writeData :: [(String, Maybe Entry, [Entry])] -> IO ()
writeData [] = print "done"
writeData (q@(n, com, is) : t) = do
  -- case h of
  --   Item c _ _ _ -> do
  writeFile fileName fileContent
  writeData t
  where
    fileName :: FilePath
    fileName = printf dataFile n
    fileContent :: String
    fileContent = formatDataItem q

-- _ -> writeData t

formatDataItem :: (String, Maybe Entry, [Entry]) -> String
formatDataItem (n, cm, is) =
  L.intercalate
    "\n"
    [ "-- GENERATED",
      "{-# LANGUAGE OverloadedStrings #-}\n",
      printf "module TD.Reply.%s where\n" n,
      case cm of
        Nothing -> ""
        Just c -> do
          printf "-- | %s" (comment c),
      printf "data %s =" n,
      L.intercalate
        " |\n"
        (map printDataType is)
    ]
  where
    printDataType :: Entry -> String
    printDataType (Item cl con com arg) = do
      L.concat
        [ " -- |\n -- ",
          L.intercalate "\n -- " com,
          printf "\n %s" con,
          case arg of
            [] -> ""
            x -> "\n  {" ++ L.intercalate "," (map printArg x) ++ "\n  }"
        ]
    printDataType _ = error "error"
    printArg :: Arg -> String
    printArg a =
      "\n    -- |\n    -- "
        ++ L.intercalate "\n    -- " (comments_ a)
        ++ printf "\n    %s :: %s" (key a) (value a)

-- formatDataItem _ = error "not item"

groupDataItems :: [(String, Maybe Entry, [Entry])] -> Entry -> [(String, Maybe Entry, [Entry])]
groupDataItems list q@(ClassComment n c) =
  case filter (\(name, _, _) -> name == n) list of
    [] -> list ++ [(n, Just q, [])]
    _ -> error "grouping error"
groupDataItems list q@(Item cl con com arg) = do
  case filter (\(name, _, _) -> name == cl) list of
    [] -> list ++ [(cl, Nothing, [q])]
    [(x0, x1, x2)] -> (filter (\(name, _, _) -> name /= cl) list) ++ [(x0, x1, x2 ++ [q])]
    _ -> error "grouping error"
groupDataItems _ _ = error "grouping error"

fixConstructors :: Entry -> Entry
fixConstructors (Item cl c com arg) = Item {class_ = cl, constructor = toTitle c, comments = com, args = arg}
fixConstructors q = q

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
insertComments (Just i, a, acc) (Item cl con com arg) = do
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
  | L.isPrefixOf "//@class " h = do
    let (name, rest) = LE.breakOn " " $ myStripPrefix "//@class " h
    acc ++ [ClassComment {name = name, comment = myStripPrefix " @description " rest}]
  | L.isPrefixOf "//@description " h =
    acc ++ [CommentStart (myStripPrefix "//@description " h)]
  | L.isPrefixOf "//@" h = do
    let (name, rest) = LE.breakOn " " $ myStripPrefix "//@" h
    acc ++ [ArgComment {name = name, comment = myStripPrefix " " rest}]
  | L.isPrefixOf "//-" h = do
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
