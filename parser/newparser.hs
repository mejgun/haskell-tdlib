#!/usr/bin/env stack
-- stack --resolver lts-18.28 script

{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO (readFile, writeFile)
import qualified Debug.Trace as Debug (trace, traceId)
import Text.Printf (printf)

data Entry
  = ClassComment
      { name :: T.Text,
        comment :: T.Text
      }
  | CommentStart T.Text
  | Comment T.Text
  | ArgComment
      { name :: T.Text,
        comment :: T.Text
      }
  | Item
      { class_ :: T.Text,
        constructor :: T.Text,
        comments :: [T.Text],
        args :: [Arg]
      }
  deriving (Show, Eq)

data Arg = Arg
  { key :: T.Text,
    value :: T.Text,
    comments_ :: [T.Text]
  }
  deriving (Show, Eq)

data StructuredClass = SC
  { classname :: T.Text,
    classcomment :: T.Text,
    items :: [StructuredItem]
  }

data StructuredItem = SI
  { itemconstructor :: T.Text,
    itemcomments :: [T.Text],
    itemargs :: [Arg]
  }

main :: IO ()
main = do
  l <- TIO.readFile "td_api.tl"
  let [d, f] = T.splitOn "---functions---" l
  let dat = filter (not . T.null) . map T.strip $ T.splitOn "\n" d
  let a = filter (not . isJunk) $ foldl parse [] dat
  -- let b = foldr structureData (Nothing, []) a
  let b = foldl moveentries (Nothing, []) a
  mapM_ print a
  writeData a

dataFile :: String
dataFile = "TD/Reply/%s.hs"

writeData :: [Entry] -> IO ()
writeData [] = print "ok"
writeData (h : t) = do
  case h of
    -- ClassComment txt txt' -> _
    -- CommentStart txt -> _
    -- Comment txt -> _
    -- ArgComment txt txt' -> _
    Item c _ _ _ -> do
      writeFile fileName fileContent
      writeData t
      where
        fileName :: FilePath
        fileName = printf dataFile c
        fileContent :: String
        fileContent = formatDataItem h
    _ -> writeData t

formatDataItem :: Entry -> String
formatDataItem (Item cl co cmnts args) =
  concat
    [ printf "module %s where\n" cl,
      printf "he he %s " co,
      printf "he he %s " cl
    ]
formatDataItem _ = error "not item"

moveentries :: (Maybe Entry, [Entry]) -> Entry -> (Maybe Entry, [Entry])
moveentries q@(cur, acc) entry = do
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

parse :: [Entry] -> T.Text -> [Entry]
parse acc h
  | T.isPrefixOf "//@class " h = do
    let (name, rest) = T.breakOn " " $ strip "//@class " h
    acc ++ [ClassComment {name = name, comment = strip " @description " rest}]
  | T.isPrefixOf "//@description " h =
    acc ++ [CommentStart (strip "//@description " h)]
  | T.isPrefixOf "//@" h = do
    let (name, rest) = T.breakOn " " $ strip "//@" h
    acc ++ [ArgComment {name = name, comment = strip " " rest}]
  | T.isPrefixOf "//-" h = do
    acc ++ [Comment (strip "//-" h)]
  | length (T.splitOn " = " h) == 2 = do
    let (r, cl) = T.breakOn " = " h
    let (constr, r2) = T.breakOn " " r
    let a1 = case T.strip r2 of
          "" -> []
          x -> map (T.breakOn ":") $ T.splitOn " " x
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

strip :: T.Text -> T.Text -> T.Text
strip w t = do
  case T.stripPrefix w t of
    Nothing -> error $show t
    Just r -> r

myStrip :: T.Text -> T.Text
myStrip =
  T.strip
    . T.dropAround (== ':')
    . T.strip
    . T.dropAround (== '=')
    . T.strip
    . T.dropAround (== ';')
    . T.strip

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

-- getComments :: T.Text -> [T.Text]
-- getComments = map strip . filter (T.isPrefixOf "//") . map T.strip . T.splitOn "\n"
-- where
-- strip s = do
-- let Just r = T.stripPrefix "//" s
-- r

{-
splitToItems :: T.Text -> [T.Text]
splitToItems =
  filter (/= "")
    . map (T.strip . T.dropAround (== '\n') . T.strip)
    . T.splitOn "\n//@description"

itemToEntry :: T.Text -> Entry
itemToEntry x = do
  let splited = filter (/= "") . map T.strip $ T.splitOn "\n" x
  let comments = head splited : map (T.dropWhile (== '/')) (filter (T.isPrefixOf "//") splited)
  let [dat] = filter (not . T.isPrefixOf "//") $ tail splited
  let (a, name) = T.breakOn "=" dat
  let (constr, rest) = T.breakOn " " a
  Entry
    { comments = takeWhile (not . T.isPrefixOf "@") comments,
      name = myStrip name,
      constructor = myStrip constr,
      args = []
    }

-}

-- -- | convert "chatPhoto small:file big:file = ChatPhoto;" to
-- -- map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
-- --
-- -- map(data type name)=[(data type contructor), (string)]
-- -- toMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
-- toMap :: [T.Text] -> [Entry]
-- toMap t =
--   -- foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $
--   -- map format t
--   -- format l
--   -- where
--   -- format l = do
--   do
--     let comments = filter (T.isPrefixOf "//") t
--     let (dat : _) = filter (== T.empty) . filter (not . T.isPrefixOf "//") $t
--     let (a, name) = T.breakOn "=" dat
--     let (constr, rest) = T.breakOn " " a
