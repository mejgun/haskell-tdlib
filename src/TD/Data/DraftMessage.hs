module TD.Data.DraftMessage
  ( DraftMessage(..)    
  , defaultDraftMessage 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.DraftMessageContent as DraftMessageContent
import qualified TD.Data.InputSuggestedPostInfo as InputSuggestedPostInfo

data DraftMessage
  = DraftMessage -- ^ Contains information about a message draft
    { reply_to            :: Maybe InputMessageReplyTo.InputMessageReplyTo       -- ^ Information about the message to be replied; inputMessageReplyToStory is unsupported; may be null if none
    , date                :: Maybe Int                                           -- ^ Point in time (Unix timestamp) when the draft was created
    , content             :: Maybe DraftMessageContent.DraftMessageContent       -- ^ Content of the message draft
    , effect_id           :: Maybe Int                                           -- ^ Identifier of the effect to apply to the message when it is sent; 0 if none
    , suggested_post_info :: Maybe InputSuggestedPostInfo.InputSuggestedPostInfo -- ^ Information about the suggested post; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow DraftMessage where
  shortShow DraftMessage
    { reply_to            = reply_to_
    , date                = date_
    , content             = content_
    , effect_id           = effect_id_
    , suggested_post_info = suggested_post_info_
    }
      = "DraftMessage"
        ++ I.cc
        [ "reply_to"            `I.p` reply_to_
        , "date"                `I.p` date_
        , "content"             `I.p` content_
        , "effect_id"           `I.p` effect_id_
        , "suggested_post_info" `I.p` suggested_post_info_
        ]

instance AT.FromJSON DraftMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "draftMessage" -> parseDraftMessage v
      _              -> mempty
    
    where
      parseDraftMessage :: A.Value -> AT.Parser DraftMessage
      parseDraftMessage = A.withObject "DraftMessage" $ \o -> do
        reply_to_            <- o A..:?                       "reply_to"
        date_                <- o A..:?                       "date"
        content_             <- o A..:?                       "content"
        effect_id_           <- fmap I.readInt64 <$> o A..:?  "effect_id"
        suggested_post_info_ <- o A..:?                       "suggested_post_info"
        pure $ DraftMessage
          { reply_to            = reply_to_
          , date                = date_
          , content             = content_
          , effect_id           = effect_id_
          , suggested_post_info = suggested_post_info_
          }
  parseJSON _ = mempty

instance AT.ToJSON DraftMessage where
  toJSON DraftMessage
    { reply_to            = reply_to_
    , date                = date_
    , content             = content_
    , effect_id           = effect_id_
    , suggested_post_info = suggested_post_info_
    }
      = A.object
        [ "@type"               A..= AT.String "draftMessage"
        , "reply_to"            A..= reply_to_
        , "date"                A..= date_
        , "content"             A..= content_
        , "effect_id"           A..= fmap I.writeInt64  effect_id_
        , "suggested_post_info" A..= suggested_post_info_
        ]

defaultDraftMessage :: DraftMessage
defaultDraftMessage =
  DraftMessage
    { reply_to            = Nothing
    , date                = Nothing
    , content             = Nothing
    , effect_id           = Nothing
    , suggested_post_info = Nothing
    }

