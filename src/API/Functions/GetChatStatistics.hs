-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true 
-- 
-- __chat_id__ Chat identifier
-- 
-- __is_dark__ Pass true if a dark theme is used by the application
data GetChatStatistics = 

 GetChatStatistics { is_dark :: Maybe Bool, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatStatistics where
 show GetChatStatistics { is_dark=is_dark, chat_id=chat_id } =
  "GetChatStatistics" ++ U.cc [U.p "is_dark" is_dark, U.p "chat_id" chat_id ]

instance T.ToJSON GetChatStatistics where
 toJSON GetChatStatistics { is_dark = is_dark, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatStatistics", "is_dark" A..= is_dark, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatStatistics" -> parseGetChatStatistics v
   _ -> mempty
  where
   parseGetChatStatistics :: A.Value -> T.Parser GetChatStatistics
   parseGetChatStatistics = A.withObject "GetChatStatistics" $ \o -> do
    is_dark <- o A..:? "is_dark"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatStatistics { is_dark = is_dark, chat_id = chat_id }
 parseJSON _ = mempty
