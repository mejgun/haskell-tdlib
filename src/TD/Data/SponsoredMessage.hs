{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SponsoredMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkInfo as ChatInviteLinkInfo
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified TD.Data.MessageContent as MessageContent
import qualified Utils as U

-- |
data SponsoredMessage = -- | Describes a sponsored message
  SponsoredMessage
  { -- | Content of the message. Currently, can be only of the type messageText
    content :: Maybe MessageContent.MessageContent,
    -- | An internal link to be opened when the sponsored message is clicked; may be null if the sponsor chat needs to be opened instead
    link :: Maybe InternalLinkType.InternalLinkType,
    -- | Information about the sponsor chat; may be null unless sponsor_chat_id == 0
    sponsor_chat_info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo,
    -- | Sponsor chat identifier; 0 if the sponsor chat is accessible through an invite link
    sponsor_chat_id :: Maybe Int,
    -- | Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
    message_id :: Maybe Int
  }
  deriving (Eq)

instance Show SponsoredMessage where
  show
    SponsoredMessage
      { content = content_,
        link = link_,
        sponsor_chat_info = sponsor_chat_info_,
        sponsor_chat_id = sponsor_chat_id_,
        message_id = message_id_
      } =
      "SponsoredMessage"
        ++ U.cc
          [ U.p "content" content_,
            U.p "link" link_,
            U.p "sponsor_chat_info" sponsor_chat_info_,
            U.p "sponsor_chat_id" sponsor_chat_id_,
            U.p "message_id" message_id_
          ]

instance T.FromJSON SponsoredMessage where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sponsoredMessage" -> parseSponsoredMessage v
      _ -> mempty
    where
      parseSponsoredMessage :: A.Value -> T.Parser SponsoredMessage
      parseSponsoredMessage = A.withObject "SponsoredMessage" $ \o -> do
        content_ <- o A..:? "content"
        link_ <- o A..:? "link"
        sponsor_chat_info_ <- o A..:? "sponsor_chat_info"
        sponsor_chat_id_ <- mconcat [o A..:? "sponsor_chat_id", U.rm <$> (o A..: "sponsor_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ SponsoredMessage {content = content_, link = link_, sponsor_chat_info = sponsor_chat_info_, sponsor_chat_id = sponsor_chat_id_, message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON SponsoredMessage where
  toJSON
    SponsoredMessage
      { content = content_,
        link = link_,
        sponsor_chat_info = sponsor_chat_info_,
        sponsor_chat_id = sponsor_chat_id_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "sponsoredMessage",
          "content" A..= content_,
          "link" A..= link_,
          "sponsor_chat_info" A..= sponsor_chat_info_,
          "sponsor_chat_id" A..= sponsor_chat_id_,
          "message_id" A..= message_id_
        ]
