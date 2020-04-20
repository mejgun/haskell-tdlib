{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text                     as T
--import           Data.ByteString               as B
import qualified Data.List                     as L
import qualified Data.Map.Strict               as Map
import qualified Data.Set                      as Set


api :: T.Text
api = "API"

apifuncs :: T.Text
apifuncs = "API/Functions"

main :: IO ()
main = do
  -- l <- getContents
  l <- T.pack <$> readFile "work_api.tl"

  let [dat, funcs] = T.splitOn "---functions---" l

  let a            = T.lines dat
  let m = renameWrongTypedField . parseParams . filterKeys $ toMap a

  let b            = T.lines funcs
  let f = renameWrongTypedField . parseParams . filterKeys $ functionsToMap b

  let g            = uniq $ makeGeneralResult (b)
  writeToFiles api      api             (Map.insert "GeneralResult" g m)
  --print f
  writeToFiles apifuncs "API.Functions" f

  -- let a            = map T.words $ T.lines dat
  -- mapM_ (\x -> print (formatString x)) a
  --let m1 = foldl (\acc (x, y) -> Map.insertWith (++) x [y] acc) Map.empty
    --    $ map formatString a
  -- print m1
  -- let z = Map.foldlWithKey
  --       (\acc k x -> T.concat
  --         ("data " : k : " = " : (T.intercalate " | " x) : "\n" : acc : [])
  --       )
  --       ""
  --       m1
  -- putStrLn $ T.unpack z
  --print m

writeToFiles
  :: T.Text -> T.Text -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])] -> IO ()
writeToFiles addr modName m =
  mapM_
      (\(a, b) -> do
        writeFile (T.unpack (T.concat ["../src/", addr, "/", a, ".hs"]))
                  (w a b (Map.keys m))
        writeFile (T.unpack (T.concat ["../src/", addr, "/", a, ".hs-boot"]))
                  (whb a b (Map.keys m))
      )
    $ Map.toList m
 where
  whb d e a = T.unpack $ T.concat
    [ "-- GENERATED\n\n"
    , "module "
    , modName
    , "."
    , d
    , " where\n\n"
    , "import Data.Aeson.Types\n\n"
    , "data "
    , d
    , "\n\ninstance ToJSON "
    , d
    , "\n\n"
    ]
  w d e a = T.unpack $ T.concat
    [ "-- GENERATED\n"
    , "{-# LANGUAGE OverloadedStrings #-}\n"
    , "module "
    , modName
    , "."
    , d
    , " where\n\n"
    , "import qualified Data.Aeson as A\n"
    , "import qualified Data.Aeson.Types as T\n"
    , (imports $ keys e)
    , "\n--main = putStrLn \"ok\"\n\ndata "
    , d
    , " = \n "
    , ww e
    , " -- deriving (Show)"
    , toJsonString d e
    ]
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
        , T.intercalate ", " $ filter (/= " = ") $ map
          (\(x, _) -> T.concat [x, " = ", x])
          b
        , " }) =\n"
        , "  A.object [ "
        , T.intercalate ", "
        $ filter (/= "")
        $ T.concat ["\"@type\" A..= T.String \"", a, "\""]
        : map
            (\(x, _) -> if x /= ""
              then T.concat ["\"", T.dropAround (== '_') x, "\" A..= ", x]
              else ""
            )
            b
        , " ]"
        ]
      )
      e
    -- { x = x }) =
    --A.object ["@type" A..= T.String "koort", "x" A..= x]
    , T.intercalate "\n"
      $ map (\(a, b) -> T.concat ["\n-- ", a, " ", m, " ", www b]) e
    , "\n\n"
    ]
  ww :: [(T.Text, [(T.Text, T.Text)])] -> T.Text
  ww e =
    T.intercalate " \n | " $ map (\(a, b) -> T.concat [toTitle a, www b]) e
  www e =
    case T.intercalate ", " (map (\(a, b) -> T.concat [a, " :: ", b]) e) of
      "" -> ""
      p  -> case T.stripPrefix " ::" p of
        Just x -> x
        _      -> T.concat [" { ", p, " } "]
  keys :: [(T.Text, [(T.Text, T.Text)])] -> [T.Text]
  keys e = uniq $ foldl
    (\acc (_, b) -> (foldl (\acc2 (_, d) -> (myAdd d acc2)) acc b))
    []
    e
  imports :: [T.Text] -> T.Text
  imports ks = T.concat $ map
    (\k -> T.concat
      ["import {-# SOURCE #-} qualified ", api, ".", k, " as ", k, "\n"]
    )
    ks
  myAdd :: T.Text -> [T.Text] -> [T.Text]
  myAdd x xs = do
    let n@(n1 : n2) = T.split (== '.') x
    if length (n) > 1 && T.dropAround (== '[') n1 == T.dropAround (== ']')
                                                                  (head n2)
    then
      T.dropAround (== '[') (head n) : xs
    else
      xs

renameWrongTypedField
  :: Map.Map T.Text [(T.Text, [(T.Text, T.Text)])]
  -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])]
renameWrongTypedField = Map.map go
 where
  go :: [(T.Text, [(T.Text, T.Text)])] -> [(T.Text, [(T.Text, T.Text)])]
  --go e = map (\(x, y) -> (x, (gogo y))) e
  go e =
    let (_, l) = foldl
          (\(acc, ll) (x, y) -> let (m, tl) = gogo acc y in (m, (x, tl) : ll))
          (Map.empty, [])
          e
    in  l
  gogo
    :: Map.Map T.Text T.Text
    -> [(T.Text, T.Text)]
    -> (Map.Map T.Text T.Text, [(T.Text, T.Text)])
  gogo m e = foldl
    (\(acc, l) (a, b) -> let (m, tl) = myInsert acc a b in (m, tl : l))
    (m, [])
    e
   where
    checkKey k v mm = case (== v) <$> Map.lookup k mm of
      Just False -> checkKey (addUndrscr k) v mm
      _          -> k
    myInsert mm a b = do
      let key = if a `elem` ["type", "data", "id", "length", "error", "filter"]
            then addUndrscr a
            else a
      let k = checkKey key b mm
      (Map.insert k b mm, (k, b))

addUndrscr :: T.Text -> T.Text
addUndrscr a = T.concat ["_", a]
  --   where mm = Map.fromList $ foldl (\acc (_, k) -> k ++ acc) [] e
  -- gogo :: Map.Map T.Text T.Text -> [(T.Text, T.Text)] -> [(T.Text, T.Text)]
  -- gogo mm yy = map
  --   (\(j, k) ->
  --     case
  --         (and
  --           (   and
  --           <$> [ pure (j /= "type")
  --               , pure (j /= "data")
  --               , ((== k) <$> (Map.lookup j mm))
  --               ]
  --           )
  --         )
  --       of
  --         True -> (j, k)
  --         _    -> (T.concat ["_", j], k)
  --   )
  --   yy

--let m = foldl (\acc (j,k) -> Map.insert acc j k) Map.empty y

-- convert map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
-- to map["ChatPhoto"]=[("chatPhoto", [("small","file"), ("big","file")])]
parseParams
  :: Map.Map T.Text [(T.Text, T.Text)]
  -> Map.Map T.Text [(T.Text, [(T.Text, T.Text)])]
parseParams = Map.mapWithKey (\k v -> map (\(a, b) -> (a, go k b)) v)
 where
  go _    "" = []
  go aMod s  = do
    let w = T.words s
    let a = map (T.breakOn ":") w
    map (\(c, d) -> (c, conv aMod d)) a
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
      in  if t == aMod
            then aMod
            else if T.isInfixOf "[" t then t else T.concat [t, ".", t]
  checkList aMod s = do
    let s1 = T.replace "vector<" "" $ T.replace ">" "" s
    if s1 == s then s1 else T.concat ["[", conv aMod s1, "]"]


filterKeys
  :: Map.Map T.Text [(T.Text, T.Text)] -> Map.Map T.Text [(T.Text, T.Text)]
filterKeys m = Map.withoutKeys m $ Set.fromList
  [ "Double"
  , "String"
  , "Int32"
  , "Int53"
  , "Int64"
  , "Bytes"
  , "Bool"
  , "Bool"
  , "Vector t"
  , ""
  ]

-- convert "chatPhoto small:file big:file = ChatPhoto;" to
-- map["ChatPhoto"]=[("chatPhoto", "small:file big:file")]
toMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
toMap t = foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty
  $ map format t
 where
  format l = do
    let (a, name) = T.breakOn "=" l
    let (d, rest) = T.breakOn " " a
    (myStrip name, (myStrip d, myStrip rest))

-- convert "setPassportElement element:InputPassportElement password:string = PassportElement;"
-- to map[setPassportElement]=[("setPassportElement", "element:InputPassportElement password:string")]
functionsToMap :: [T.Text] -> Map.Map T.Text [(T.Text, T.Text)]
functionsToMap t =
  foldl (\acc (k, v) -> Map.insertWith (++) k [v] acc) Map.empty $ map format t
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
  (\acc x -> if length (x) > 1
    then let n = myStrip (last x) in (n, [("", T.concat [n, ".", n])]) : acc
    else acc
  )
  []
  (map (T.splitOn "=") l)

