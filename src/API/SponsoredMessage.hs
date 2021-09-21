-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SponsoredMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageContent as MessageContent

-- |
-- 
-- Describes a sponsored message 
-- 
-- __id__ Unique sponsored message identifier
-- 
-- __sponsor_chat_id__ Chat identifier
-- 
-- __start_parameter__ Parameter for the bot start message if the sponsored chat is a chat with a bot
-- 
-- __content__ Content of the message
data SponsoredMessage = 

 SponsoredMessage { content :: Maybe MessageContent.MessageContent, start_parameter :: Maybe String, sponsor_chat_id :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SponsoredMessage where
 toJSON (SponsoredMessage { content = content, start_parameter = start_parameter, sponsor_chat_id = sponsor_chat_id, _id = _id }) =
  A.object [ "@type" A..= T.String "sponsoredMessage", "content" A..= content, "start_parameter" A..= start_parameter, "sponsor_chat_id" A..= sponsor_chat_id, "id" A..= _id ]

instance T.FromJSON SponsoredMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sponsoredMessage" -> parseSponsoredMessage v
   _ -> mempty
  where
   parseSponsoredMessage :: A.Value -> T.Parser SponsoredMessage
   parseSponsoredMessage = A.withObject "SponsoredMessage" $ \o -> do
    content <- o A..:? "content"
    start_parameter <- o A..:? "start_parameter"
    sponsor_chat_id <- mconcat [ o A..:? "sponsor_chat_id", readMaybe <$> (o A..: "sponsor_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SponsoredMessage { content = content, start_parameter = start_parameter, sponsor_chat_id = sponsor_chat_id, _id = _id }