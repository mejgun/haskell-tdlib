-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetStorageStatistics = 
 GetStorageStatistics { chat_limit :: Int }  deriving (Show)

instance T.ToJSON GetStorageStatistics where
 toJSON (GetStorageStatistics { chat_limit = chat_limit }) =
  A.object [ "@type" A..= T.String "getStorageStatistics", "chat_limit" A..= chat_limit ]

instance T.FromJSON GetStorageStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStorageStatistics" -> parseGetStorageStatistics v
   _ -> mempty
  where
   parseGetStorageStatistics :: A.Value -> T.Parser GetStorageStatistics
   parseGetStorageStatistics = A.withObject "GetStorageStatistics" $ \o -> do
    chat_limit <- o A..: "chat_limit"
    return $ GetStorageStatistics { chat_limit = chat_limit }