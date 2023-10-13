module TD.Data.FoundMessages
  ( FoundMessages(..)    
  , defaultFoundMessages 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified Data.Text as T

data FoundMessages
  = FoundMessages -- ^ Contains a list of messages found by a search
    { total_count :: Maybe Int               -- ^ Approximate total number of messages found; -1 if unknown
    , messages    :: Maybe [Message.Message] -- ^ List of messages
    , next_offset :: Maybe T.Text            -- ^ The offset for the next request. If empty, there are no more results
    }
  deriving (Eq)

instance Show FoundMessages where
  show FoundMessages
    { total_count = total_count_
    , messages    = messages_
    , next_offset = next_offset_
    }
      = "FoundMessages"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "messages"    `I.p` messages_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundMessages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundMessages" -> parseFoundMessages v
      _               -> mempty
    
    where
      parseFoundMessages :: A.Value -> AT.Parser FoundMessages
      parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        messages_    <- o A..:?  "messages"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundMessages
          { total_count = total_count_
          , messages    = messages_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

instance AT.ToJSON FoundMessages where
  toJSON FoundMessages
    { total_count = total_count_
    , messages    = messages_
    , next_offset = next_offset_
    }
      = A.object
        [ "@type"       A..= AT.String "foundMessages"
        , "total_count" A..= total_count_
        , "messages"    A..= messages_
        , "next_offset" A..= next_offset_
        ]

defaultFoundMessages :: FoundMessages
defaultFoundMessages =
  FoundMessages
    { total_count = Nothing
    , messages    = Nothing
    , next_offset = Nothing
    }

