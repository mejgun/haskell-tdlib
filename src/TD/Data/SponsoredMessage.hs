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
    -- | True, if the sponsor's chat photo must be shown
    show_chat_photo :: Maybe Bool,
    -- | Information about the sponsor chat; may be null unless sponsor_chat_id == 0
    sponsor_chat_info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo,
    -- | Sponsor chat identifier; 0 if the sponsor chat is accessible through an invite link
    sponsor_chat_id :: Maybe Int,
    -- | True, if the message needs to be labeled as "recommended" instead of "sponsored"
    is_recommended :: Maybe Bool,
    -- | Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
    message_id :: Maybe Int
  }
  deriving (Eq)

instance Show SponsoredMessage where
  show
    SponsoredMessage
      { content = content_,
        link = link_,
        show_chat_photo = show_chat_photo_,
        sponsor_chat_info = sponsor_chat_info_,
        sponsor_chat_id = sponsor_chat_id_,
        is_recommended = is_recommended_,
        message_id = message_id_
      } =
      "SponsoredMessage"
        ++ U.cc
          [ U.p "content" content_,
            U.p "link" link_,
            U.p "show_chat_photo" show_chat_photo_,
            U.p "sponsor_chat_info" sponsor_chat_info_,
            U.p "sponsor_chat_id" sponsor_chat_id_,
            U.p "is_recommended" is_recommended_,
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
        show_chat_photo_ <- o A..:? "show_chat_photo"
        sponsor_chat_info_ <- o A..:? "sponsor_chat_info"
        sponsor_chat_id_ <- o A..:? "sponsor_chat_id"
        is_recommended_ <- o A..:? "is_recommended"
        message_id_ <- o A..:? "message_id"
        return $ SponsoredMessage {content = content_, link = link_, show_chat_photo = show_chat_photo_, sponsor_chat_info = sponsor_chat_info_, sponsor_chat_id = sponsor_chat_id_, is_recommended = is_recommended_, message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON SponsoredMessage where
  toJSON
    SponsoredMessage
      { content = content_,
        link = link_,
        show_chat_photo = show_chat_photo_,
        sponsor_chat_info = sponsor_chat_info_,
        sponsor_chat_id = sponsor_chat_id_,
        is_recommended = is_recommended_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "sponsoredMessage",
          "content" A..= content_,
          "link" A..= link_,
          "show_chat_photo" A..= show_chat_photo_,
          "sponsor_chat_info" A..= sponsor_chat_info_,
          "sponsor_chat_id" A..= sponsor_chat_id_,
          "is_recommended" A..= is_recommended_,
          "message_id" A..= message_id_
        ]
