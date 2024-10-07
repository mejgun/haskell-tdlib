module TD.Data.SponsoredMessage
  (SponsoredMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageSponsor as MessageSponsor
import qualified Data.Text as T

data SponsoredMessage
  = SponsoredMessage -- ^ Describes a sponsored message
    { message_id                 :: Maybe Int                           -- ^ Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
    , is_recommended             :: Maybe Bool                          -- ^ True, if the message needs to be labeled as "recommended" instead of "sponsored"
    , can_be_reported            :: Maybe Bool                          -- ^ True, if the message can be reported to Telegram moderators through reportChatSponsoredMessage
    , content                    :: Maybe MessageContent.MessageContent -- ^ Content of the message. Currently, can be only of the types messageText, messageAnimation, messagePhoto, or messageVideo. Video messages can be viewed fullscreen
    , sponsor                    :: Maybe MessageSponsor.MessageSponsor -- ^ Information about the sponsor of the message
    , title                      :: Maybe T.Text                        -- ^ Title of the sponsored message
    , button_text                :: Maybe T.Text                        -- ^ Text for the message action button
    , accent_color_id            :: Maybe Int                           -- ^ Identifier of the accent color for title, button text and message background
    , background_custom_emoji_id :: Maybe Int                           -- ^ Identifier of a custom emoji to be shown on the message background; 0 if none
    , additional_info            :: Maybe T.Text                        -- ^ If non-empty, additional information about the sponsored message to be shown along with the message
    }
  deriving (Eq, Show)

instance I.ShortShow SponsoredMessage where
  shortShow SponsoredMessage
    { message_id                 = message_id_
    , is_recommended             = is_recommended_
    , can_be_reported            = can_be_reported_
    , content                    = content_
    , sponsor                    = sponsor_
    , title                      = title_
    , button_text                = button_text_
    , accent_color_id            = accent_color_id_
    , background_custom_emoji_id = background_custom_emoji_id_
    , additional_info            = additional_info_
    }
      = "SponsoredMessage"
        ++ I.cc
        [ "message_id"                 `I.p` message_id_
        , "is_recommended"             `I.p` is_recommended_
        , "can_be_reported"            `I.p` can_be_reported_
        , "content"                    `I.p` content_
        , "sponsor"                    `I.p` sponsor_
        , "title"                      `I.p` title_
        , "button_text"                `I.p` button_text_
        , "accent_color_id"            `I.p` accent_color_id_
        , "background_custom_emoji_id" `I.p` background_custom_emoji_id_
        , "additional_info"            `I.p` additional_info_
        ]

instance AT.FromJSON SponsoredMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sponsoredMessage" -> parseSponsoredMessage v
      _                  -> mempty
    
    where
      parseSponsoredMessage :: A.Value -> AT.Parser SponsoredMessage
      parseSponsoredMessage = A.withObject "SponsoredMessage" $ \o -> do
        message_id_                 <- o A..:?                       "message_id"
        is_recommended_             <- o A..:?                       "is_recommended"
        can_be_reported_            <- o A..:?                       "can_be_reported"
        content_                    <- o A..:?                       "content"
        sponsor_                    <- o A..:?                       "sponsor"
        title_                      <- o A..:?                       "title"
        button_text_                <- o A..:?                       "button_text"
        accent_color_id_            <- o A..:?                       "accent_color_id"
        background_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "background_custom_emoji_id"
        additional_info_            <- o A..:?                       "additional_info"
        pure $ SponsoredMessage
          { message_id                 = message_id_
          , is_recommended             = is_recommended_
          , can_be_reported            = can_be_reported_
          , content                    = content_
          , sponsor                    = sponsor_
          , title                      = title_
          , button_text                = button_text_
          , accent_color_id            = accent_color_id_
          , background_custom_emoji_id = background_custom_emoji_id_
          , additional_info            = additional_info_
          }
  parseJSON _ = mempty

