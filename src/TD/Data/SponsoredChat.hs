module TD.Data.SponsoredChat
  (SponsoredChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SponsoredChat
  = SponsoredChat -- ^ Describes a sponsored chat
    { unique_id       :: Maybe Int    -- ^ Unique identifier of this result
    , chat_id         :: Maybe Int    -- ^ Chat identifier
    , sponsor_info    :: Maybe T.Text -- ^ Additional optional information about the sponsor to be shown along with the chat
    , additional_info :: Maybe T.Text -- ^ If non-empty, additional information about the sponsored chat to be shown along with the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SponsoredChat where
  shortShow SponsoredChat
    { unique_id       = unique_id_
    , chat_id         = chat_id_
    , sponsor_info    = sponsor_info_
    , additional_info = additional_info_
    }
      = "SponsoredChat"
        ++ I.cc
        [ "unique_id"       `I.p` unique_id_
        , "chat_id"         `I.p` chat_id_
        , "sponsor_info"    `I.p` sponsor_info_
        , "additional_info" `I.p` additional_info_
        ]

instance AT.FromJSON SponsoredChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sponsoredChat" -> parseSponsoredChat v
      _               -> mempty
    
    where
      parseSponsoredChat :: A.Value -> AT.Parser SponsoredChat
      parseSponsoredChat = A.withObject "SponsoredChat" $ \o -> do
        unique_id_       <- o A..:?  "unique_id"
        chat_id_         <- o A..:?  "chat_id"
        sponsor_info_    <- o A..:?  "sponsor_info"
        additional_info_ <- o A..:?  "additional_info"
        pure $ SponsoredChat
          { unique_id       = unique_id_
          , chat_id         = chat_id_
          , sponsor_info    = sponsor_info_
          , additional_info = additional_info_
          }
  parseJSON _ = mempty

