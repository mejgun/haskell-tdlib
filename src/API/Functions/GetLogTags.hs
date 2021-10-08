-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTags where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
data GetLogTags = 

 GetLogTags deriving (Eq)

instance Show GetLogTags where
 show GetLogTags {  } =
  "GetLogTags" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLogTags where
 toJSON GetLogTags {  } =
  A.object [ "@type" A..= T.String "getLogTags" ]

instance T.FromJSON GetLogTags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogTags" -> parseGetLogTags v
   _ -> mempty
  where
   parseGetLogTags :: A.Value -> T.Parser GetLogTags
   parseGetLogTags = A.withObject "GetLogTags" $ \o -> do
    return $ GetLogTags {  }
 parseJSON _ = mempty
