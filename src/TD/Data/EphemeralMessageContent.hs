module TD.Data.EphemeralMessageContent
  (EphemeralMessageContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup

data EphemeralMessageContent
  = EphemeralMessageContent -- ^ Describes an ephemeral content of a regular message, which must be shown instead of the regular content
    { can_be_saved          :: Maybe Bool                          -- ^ True, if content of the message can be saved locally
    , has_timestamped_media :: Maybe Bool                          -- ^ True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
    , content               :: Maybe MessageContent.MessageContent -- ^ Content of the message
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup       -- ^ Reply markup for the message; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow EphemeralMessageContent where
  shortShow EphemeralMessageContent
    { can_be_saved          = can_be_saved_
    , has_timestamped_media = has_timestamped_media_
    , content               = content_
    , reply_markup          = reply_markup_
    }
      = "EphemeralMessageContent"
        ++ I.cc
        [ "can_be_saved"          `I.p` can_be_saved_
        , "has_timestamped_media" `I.p` has_timestamped_media_
        , "content"               `I.p` content_
        , "reply_markup"          `I.p` reply_markup_
        ]

instance AT.FromJSON EphemeralMessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "ephemeralMessageContent" -> parseEphemeralMessageContent v
      _                         -> mempty
    
    where
      parseEphemeralMessageContent :: A.Value -> AT.Parser EphemeralMessageContent
      parseEphemeralMessageContent = A.withObject "EphemeralMessageContent" $ \o -> do
        can_be_saved_          <- o A..:?  "can_be_saved"
        has_timestamped_media_ <- o A..:?  "has_timestamped_media"
        content_               <- o A..:?  "content"
        reply_markup_          <- o A..:?  "reply_markup"
        pure $ EphemeralMessageContent
          { can_be_saved          = can_be_saved_
          , has_timestamped_media = has_timestamped_media_
          , content               = content_
          , reply_markup          = reply_markup_
          }
  parseJSON _ = mempty

