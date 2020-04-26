-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPublicMessageLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a public HTTPS link to a message. Available only for messages in supergroups and channels with a username
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
-- 
-- __for_album__ Pass true if a link for a whole media album should be returned
data GetPublicMessageLink = 
 GetPublicMessageLink { for_album :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetPublicMessageLink where
 toJSON (GetPublicMessageLink { for_album = for_album, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPublicMessageLink", "for_album" A..= for_album, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetPublicMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPublicMessageLink" -> parseGetPublicMessageLink v
   _ -> mempty
  where
   parseGetPublicMessageLink :: A.Value -> T.Parser GetPublicMessageLink
   parseGetPublicMessageLink = A.withObject "GetPublicMessageLink" $ \o -> do
    for_album <- o A..:? "for_album"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPublicMessageLink { for_album = for_album, message_id = message_id, chat_id = chat_id }