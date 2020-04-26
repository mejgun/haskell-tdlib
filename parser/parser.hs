-- you do not need to read or use this script, unless you are going to contribute to the lib

{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text                     as T
import qualified Data.Map.Strict               as Map
import qualified Data.Set                      as Set


api :: T.Text
api = "API"

apifuncs :: T.Text
apifuncs = "API/Functions"

main :: IO ()
main = do
  l <- T.pack <$> readFile "td_api.tl"
  let comments     = parseComments l
  let l1           = removeUnnecessary l

  let [dat, funcs] = T.splitOn "---functions---" l1

  let a            = T.lines dat
  let m = renameWrongTypedField . parseParams . filterKeys $ toMap a

  let b            = T.lines funcs
  let f = renameWrongTypedField . parseParams . filterKeys $ functionsToMap b

  let g            = uniq $ makeGeneralResult (b)
  writeToFiles api      api             (Map.insert "GeneralResult" g m) comments
  writeToFiles apifuncs "API.Functions" f comments
 where
  removeUnnecessary :: T.Text -> T.Text
  removeUnnecessary t =
    T.unlines $ filter (\x -> let s = T.strip x in s /= T.empty && not (T.isPrefixOf "//" s)) $ T.lines t

writeToFiles :: T.Text -> T.Text -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])] -> Map.Map T.Text [T.Text] -> IO ()
writeToFiles addr modName m cmnts =
  mapM_
      (\(a, b) -> do
        writeFile (T.unpack (T.concat ["../src/", addr, "/", a, ".hs"]))      (wr a b)
        writeFile (T.unpack (T.concat ["../src/", addr, "/", a, ".hs-boot"])) (whr a)
      )
    $ Map.toList m
 where
  generated = "-- GENERATED\n"
  moduleName d = T.concat ["module ", modName, ".", d, " where\n\n"]
  wr a b = if a == "GeneralResult" then wgr a b else w a b
  whr a = if a == "GeneralResult" then wgrhb a else whb a
  -- write GeneralResult.hs-boot file
  wgrhb d = T.unpack $ T.concat
    [ generated
    , moduleName d
    , "import Data.Aeson.Types\n\n"
    , "data "
    , d
    , "\n\ndata ResultWithExtra"
    , "\n\ninstance Eq "
    , d
    , "\n\ninstance FromJSON "
    , d
    , "\n\ninstance Show "
    , d
    , "\n\ninstance FromJSON ResultWithExtra"
    , "\n\ninstance Show ResultWithExtra"
    ]
  -- write GeneralResult.hs file
  wgr d e = T.unpack $ T.concat
    [ generated
    , "{-# LANGUAGE OverloadedStrings #-}\n"
    , moduleName d
    , "import qualified Data.Aeson as A\n"
    , "import qualified Data.Aeson.Types as T\n"
    , (imports $ keys e)
    , "\ndata "
    , d
    , " = \n "
    , T.intercalate " \n | " ww
    , " deriving (Show, Eq)"
    , "\n\ndata ResultWithExtra = ResultWithExtra GeneralResult (Maybe String) deriving (Show, Eq)"
    , "\n\ninstance T.FromJSON ResultWithExtra where\n"
    , " parseJSON v@(T.Object obj) = do\n"
    , "   case (T.fromJSON v :: T.Result GeneralResult) of\n"
    , "    T.Success a -> return $ ResultWithExtra a e\n"
    , "    _           -> mempty\n"
    , "  where\n"
    , "   e :: Maybe String\n"
    , "   e = case T.parse (\\o -> o A..:? \"@extra\" :: T.Parser (Maybe String)) obj of\n"
    , "     T.Success r -> r\n"
    , "     _           -> Nothing\n"
    , T.concat
      [ "\n\ninstance T.FromJSON "
      , d
      , " where\n"
      , " parseJSON v@(T.Object obj) = do\n"
      , T.concat
        [ "   mconcat t\n"
        , "  where\n"
        , "   t =\n"
        , "     [\n"
        , T.intercalate ",\n" $ map
          (\(a, _) -> T.concat
            [ "      case (T.fromJSON v :: T.Result "
            , a
            , "."
            , a
            , ") of\n"
            , "       T.Success a -> return $ "
            , a
            , " a\n"
            , "       _ -> mempty"
            ]
          )
          e
        , "\n    ]\n"
        ]
      ]
    ]
   where
    ww = map (\(a, b) -> T.concat [toTitle a, " ", (www b)]) e
    www l = T.intercalate " " (map (\(_, b) -> b) l)
  -- write other .hs-boot files
  whb d = T.unpack $ T.concat
    [ generated
    , moduleName d
    , "import Data.Aeson.Types\n\n"
    , "data "
    , d
    , "\n\ninstance Eq "
    , d
    , "\n\ninstance ToJSON "
    , d
    , "\n\ninstance FromJSON "
    , d
    , "\n\ninstance Show "
    , d
    , "\n\n"
    ]
  -- write other .hs files
  w d e = T.unpack $ T.concat
    [ generated
    , "{-# LANGUAGE OverloadedStrings #-}\n"
    , moduleName d
    , "import Text.Read (readMaybe)\n\n"
    , "import qualified Data.Aeson as A\n"
    , "import qualified Data.Aeson.Types as T\n"
    , (imports $ keys e)
    , "\n"
    , T.intercalate "\n-- \n" (Map.findWithDefault ["-- comments parse failed"] d cmnts)
    , "\ndata "
    , d
    , " = \n "
    , ww e
    , " deriving (Show, Eq)"
    , toJsonString d e
    ]
  imports :: [T.Text] -> T.Text
  imports ks = T.concat $ map (\k -> T.concat ["import {-# SOURCE #-} qualified ", api, ".", k, " as ", k, "\n"]) ks
  keys :: [(T.Text, [(T.Text, T.Text)])] -> [T.Text]
  keys e = uniq $ foldl (\acc (_, b) -> (foldl (\acc2 (_, d) -> (myAdd (T.replace "Maybe " "" d) acc2)) acc b)) [] e
  ww :: [(T.Text, [(T.Text, T.Text)])] -> T.Text
  ww e = T.intercalate " \n | " $ map (\(a, b) -> T.concat [toTitle a, www b]) e
  www e = case T.intercalate ", " (map (\(a, b) -> T.concat [a, " :: ", b]) e) of
    "" -> ""
    p  -> T.concat [" { ", p, " } "]
  toJsonString :: T.Text -> [(T.Text, [(T.Text, T.Text)])] -> T.Text
  toJsonString m e = T.concat
    [ "\n\ninstance T.ToJSON "
    , m
    , " where"
    , T.intercalate "\n" $ map
      (\(a, b) -> T.concat
        [ "\n toJSON ("
        , toTitle a
        , " { "
        , T.intercalate ", " $ filter (/= " = ") $ map (\(x, _) -> T.concat [x, " = ", x]) b
        , " }) =\n"
        , "  A.object [ "
        , T.intercalate ", "
        $ filter (/= "")
        $ T.concat ["\"@type\" A..= T.String \"", a, "\""]
        : map (\(x, _) -> if x /= "" then T.concat ["\"", T.dropAround (== '_') x, "\" A..= ", x] else "") b
        , " ]"
        ]
      )
      e
    , "\n\ninstance T.FromJSON "
    , m
    , " where\n"
    , " parseJSON v@(T.Object obj) = do\n"
    , T.concat
      [ "  t <- obj A..: \"@type\" :: T.Parser String\n"
      , "  case t of\n"
      , T.intercalate "\n"
      $  (map (\(a, b) -> T.concat ["   \"", a, "\" -> parse", toTitle a, " v"]) e)
      ++ ["   _ -> mempty"]
      , "\n  where\n"
      , T.intercalate "\n\n" $ map
        (\(a, b) -> T.concat
          [ "   parse"
          , toTitle a
          , " :: A.Value -> T.Parser "
          , m
          , "\n"
          , "   parse"
          , toTitle a
          , " = A.withObject \""
          , toTitle a
          , "\" $ \\o -> do\n"
          , T.intercalate "\n"
          $  map
               (\(c, typ) -> if typ /= "Maybe Int"
                 then T.concat ["    ", c, " <- o A..:? \"", T.dropAround (== '_') c, "\""]
                 else T.concat
                   [ "    "
                   , c
                   , " <- mconcat [ o A..:? \""
                   , T.dropAround (== '_') c
                   , "\", readMaybe <$> (o A..: \""
                   , T.dropAround (== '_') c
                   , "\" :: T.Parser String)] :: T.Parser (Maybe Int)"
                   ]
               )
               b
          ++ [ T.concat
                 [ "    return $ "
                 , toTitle a
                 , " { "
                 , T.intercalate ", " $ map (\(c, _) -> T.concat [c, " = ", c]) b
                 , " }"
                 ]
             ]
          ]
        )
        e
      ]
    ]
  myAdd :: T.Text -> [T.Text] -> [T.Text]
  myAdd x xs = do
    let n@(n1 : n2) = T.split (== '.') x
    if length (n) > 1 && T.dropAround (== '[') n1 == T.dropAround (== ']') (head n2)
      then T.dropAround (== '[') (head n) : xs
      else xs

-- | recursively rename (add _) record field name if there is same field with
--   different type or if it is eq to haskell reserved word
renameWrongTypedField :: Map.Map T.Text [(T.Text, [(T.Text, T.Text)])] -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])]
renameWrongTypedField = Map.map go
 where
  go :: [(T.Text, [(T.Text, T.Text)])] -> [(T.Text, [(T.Text, T.Text)])]
  go e =
    let (_, l) = foldl (\(acc, ll) (x, y) -> let (m, tl) = gogo acc y in (m, (x, tl) : ll)) (Map.empty, []) e in l
  gogo :: Map.Map T.Text T.Text -> [(T.Text, T.Text)] -> (Map.Map T.Text T.Text, [(T.Text, T.Text)])
  gogo m e = foldl (\(acc, l) (a, b) -> let (mm, tl) = myInsert acc a b in (mm, tl : l)) (m, []) e
   where
    checkKey k v mm = case (== v) <$> Map.lookup k mm of
      Just False -> checkKey (addUndrscr k) v mm
      _          -> k
    myInsert mm a b = do
      let key = if a `elem` ["type", "data", "id", "length", "error", "filter"] then addUndrscr a else a
      let k   = checkKey key b mm
      (Map.insert k b mm, (k, b))

addUndrscr :: T.Text -> T.Text
addUndrscr a = T.concat ["_", a]


-- | break strings to data:type tuples.
--   convert map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
--   to map["ChatPhoto"]=[("chatPhoto", [("small","file"), ("big","file")])]
--
--   map[(data type name)]=[(data type contructor), [((record field name),(record field type))]
parseParams :: Map.Map T.Text [(T.Text, T.Text)] -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])]
parseParams = Map.mapWithKey (\k v -> map (\(a, b) -> (a, go k b)) v)
 where
  -- go: first argument - current module name.
  -- need for double data type name for correct import.
  -- e.g. TextMessage.TextMessage
  go :: T.Text -> T.Text -> [(T.Text, T.Text)]
  go _    "" = []
  go aMod s  = do
    let w = T.words s
    let a = map (T.breakOn ":") w
    map (\(c, d) -> (c, T.concat ["Maybe ", conv aMod d])) a
  conv aMod s = case T.dropAround (== ':') s of
    "Bool"   -> "Bool"
    "int32"  -> "Int"
    "int53"  -> "Int"
    "int64"  -> "Int"
    "string" -> "String"
    "bytes"  -> "String"
    "double" -> "Float"
    p ->
      let t = toTitle $ checkList aMod p
      in  if t == aMod then aMod else if T.isInfixOf "[" t then t else T.concat [t, ".", t]
  checkList aMod s = do
    let s1 = T.replace "vector<" "" $ T.replace ">" "" s
    if s1 == s then s1 else T.concat ["[", conv aMod s1, "]"]


-- | remove default data types from top level
filterKeys :: Map.Map T.Text [(T.Text, T.Text)] -> Map.Map T.Text [(T.Text, T.Text)]
filterKeys m = Map.withoutKeys m
  $ Set.fromList ["Double", "String", "Int32", "Int53", "Int64", "Bytes", "Bool", "Bool", "Vector t", ""]

-- | convert "chatPhoto small:file big:file = ChatPhoto;" to
-- map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
--
-- map(data type name)=[(data type contructor), (string)]
toMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
toMap t = foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $ map format t
 where
  format l = do
    let (a, name) = T.breakOn "=" l
    let (d, rest) = T.breakOn " " a
    (myStrip name, (myStrip d, myStrip rest))

-- convert "setPassportElement element:InputPassportElement password:string = PassportElement;"
-- to map[setPassportElement]=[("setPassportElement", "element:InputPassportElement password:string")]
functionsToMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
functionsToMap t = foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $ map format t
 where
  format l = do
    let (a, result)  = T.breakOn "=" l
    let (name, rest) = T.breakOn " " a
    (toTitle (myStrip name), (myStrip name, myStrip rest))

toTitle :: T.Text -> T.Text
toTitle "" = ""
toTitle x  = T.append (T.toUpper (T.singleton (T.head x))) (T.tail x)

myStrip :: T.Text -> T.Text
myStrip = T.strip . T.dropAround (== '=') . T.dropAround (== ';') . T.strip

uniq :: (Eq a) => [a] -> [a]
uniq l = foldl (\acc x -> if (x `elem` acc) then acc else x : acc) [] l

makeGeneralResult :: [T.Text] -> [(T.Text, [(T.Text, T.Text)])]
makeGeneralResult l = foldl
  (\acc x -> if length (x) > 1 then let n = myStrip (last x) in (n, [("", T.concat [n, ".", n])]) : acc else acc)
  []
  (map (T.splitOn "=") l)


parseComments :: T.Text -> Map.Map T.Text [T.Text]
parseComments l = do
  let s  = tail $ T.splitOn "\n//@description " l
  let s1 = map (\y -> filter (\x -> (x /= T.empty) && not (T.isPrefixOf (T.pack "@class ") x)) $ T.splitOn "\n//" y) s
  let m  = Map.empty :: Map.Map T.Text [T.Text]
  let m1 = foldl
        (\acc t ->
          let x = T.splitOn "\n" $ last t
              a = head $ T.words $ head $ tail x
          in  Map.insert (toTitle a) ((init t) ++ [head x]) acc
        )
        m
        s1
  let c  = tail $ T.splitOn "\n//@class" l
  let c1 = map (T.strip . head . T.splitOn "\n") c
  let m2 = foldl
        (\acc t ->
          let (n : ns) = T.words t
              d        = T.unwords (filter (/= "@description") ns)
          in  Map.insert (toTitle n) [d] acc
        )
        m1
        c1
  --Map.map (\t -> "-- |" : map (\t -> T.concat ["-- ", t]) t) m2
  let m3 = Map.map (\t -> foldr (\x acc -> (filter (/= T.empty) (splitAtAt x)) ++ acc) [] t) m2
  Map.map (\t -> "-- |" : map (\x -> T.concat ["-- ", x]) t) m3
 where
  toHyperlinkFirst :: T.Text -> T.Text
  toHyperlinkFirst t =
    let (x : xs) = T.words t
        x1       = T.concat ["__", x, "__"]
    in  T.unwords (x1 : xs)
  splitAtAt :: T.Text -> [T.Text]
  splitAtAt t = let (x : xs) = T.splitOn "@" t in if length xs > 0 then x : map toHyperlinkFirst xs else [t]


