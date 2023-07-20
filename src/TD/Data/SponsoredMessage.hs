{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SponsoredMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageSponsor as MessageSponsor
import qualified Utils as U

-- |
data SponsoredMessage = -- | Describes a sponsored message
  SponsoredMessage
  { -- | If non-empty, additional information about the sponsored message to be shown along with the message
    additional_info :: Maybe String,
    -- | Information about the sponsor of the message
    sponsor :: Maybe MessageSponsor.MessageSponsor,
    -- | Content of the message. Currently, can be only of the type messageText
    content :: Maybe MessageContent.MessageContent,
    -- | True, if the message needs to be labeled as "recommended" instead of "sponsored"
    is_recommended :: Maybe Bool,
    -- | Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
    message_id :: Maybe Int
  }
  deriving (Eq)

instance Show SponsoredMessage where
  show
    SponsoredMessage
      { additional_info = additional_info_,
        sponsor = sponsor_,
        content = content_,
        is_recommended = is_recommended_,
        message_id = message_id_
      } =
      "SponsoredMessage"
        ++ U.cc
          [ U.p "additional_info" additional_info_,
            U.p "sponsor" sponsor_,
            U.p "content" content_,
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
        additional_info_ <- o A..:? "additional_info"
        sponsor_ <- o A..:? "sponsor"
        content_ <- o A..:? "content"
        is_recommended_ <- o A..:? "is_recommended"
        message_id_ <- o A..:? "message_id"
        return $ SponsoredMessage {additional_info = additional_info_, sponsor = sponsor_, content = content_, is_recommended = is_recommended_, message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON SponsoredMessage where
  toJSON
    SponsoredMessage
      { additional_info = additional_info_,
        sponsor = sponsor_,
        content = content_,
        is_recommended = is_recommended_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "sponsoredMessage",
          "additional_info" A..= additional_info_,
          "sponsor" A..= sponsor_,
          "content" A..= content_,
          "is_recommended" A..= is_recommended_,
          "message_id" A..= message_id_
        ]
