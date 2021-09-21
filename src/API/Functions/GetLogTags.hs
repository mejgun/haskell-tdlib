-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTags where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
data GetLogTags = 

 GetLogTags deriving (Show, Eq)

instance T.ToJSON GetLogTags where
 toJSON (GetLogTags {  }) =
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