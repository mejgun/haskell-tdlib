-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SponsoredMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageContent as MessageContent
import {-# SOURCE #-} qualified API.InternalLinkType as InternalLinkType
import {-# SOURCE #-} qualified API.ChatInviteLinkInfo as ChatInviteLinkInfo

-- |
-- 
-- Describes a sponsored message
-- 
-- __message_id__ Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
-- 
-- __sponsor_chat_id__ Sponsor chat identifier; 0 if the sponsor chat is accessible through an invite link
-- 
-- __sponsor_chat_info__ Information about the sponsor chat; may be null unless sponsor_chat_id == 0
-- 
-- __link__ An internal link to be opened when the sponsored message is clicked; may be null if the sponsor chat needs to be opened instead
-- 
-- __content__ Content of the message. Currently, can be only of the type messageText
data SponsoredMessage = 

 SponsoredMessage { content :: Maybe MessageContent.MessageContent, link :: Maybe InternalLinkType.InternalLinkType, sponsor_chat_info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo, sponsor_chat_id :: Maybe Int, message_id :: Maybe Int }  deriving (Eq)

instance Show SponsoredMessage where
 show SponsoredMessage { content=content, link=link, sponsor_chat_info=sponsor_chat_info, sponsor_chat_id=sponsor_chat_id, message_id=message_id } =
  "SponsoredMessage" ++ U.cc [U.p "content" content, U.p "link" link, U.p "sponsor_chat_info" sponsor_chat_info, U.p "sponsor_chat_id" sponsor_chat_id, U.p "message_id" message_id ]

instance T.ToJSON SponsoredMessage where
 toJSON SponsoredMessage { content = content, link = link, sponsor_chat_info = sponsor_chat_info, sponsor_chat_id = sponsor_chat_id, message_id = message_id } =
  A.object [ "@type" A..= T.String "sponsoredMessage", "content" A..= content, "link" A..= link, "sponsor_chat_info" A..= sponsor_chat_info, "sponsor_chat_id" A..= sponsor_chat_id, "message_id" A..= message_id ]

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
    link <- o A..:? "link"
    sponsor_chat_info <- o A..:? "sponsor_chat_info"
    sponsor_chat_id <- mconcat [ o A..:? "sponsor_chat_id", readMaybe <$> (o A..: "sponsor_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SponsoredMessage { content = content, link = link, sponsor_chat_info = sponsor_chat_info, sponsor_chat_id = sponsor_chat_id, message_id = message_id }
 parseJSON _ = mempty
