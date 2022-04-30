-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns storage usage statistics. Can be called before authorization 
-- 
-- __chat_limit__ The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
data GetStorageStatistics = 

 GetStorageStatistics { chat_limit :: Maybe Int }  deriving (Eq)

instance Show GetStorageStatistics where
 show GetStorageStatistics { chat_limit=chat_limit } =
  "GetStorageStatistics" ++ U.cc [U.p "chat_limit" chat_limit ]

instance T.ToJSON GetStorageStatistics where
 toJSON GetStorageStatistics { chat_limit = chat_limit } =
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
    chat_limit <- mconcat [ o A..:? "chat_limit", readMaybe <$> (o A..: "chat_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetStorageStatistics { chat_limit = chat_limit }
 parseJSON _ = mempty
