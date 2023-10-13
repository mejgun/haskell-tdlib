module TD.Data.MessageSenders
  ( MessageSenders(..)    
  , defaultMessageSenders 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data MessageSenders
  = MessageSenders -- ^ Represents a list of message senders
    { total_count :: Maybe Int                           -- ^ Approximate total number of messages senders found
    , senders     :: Maybe [MessageSender.MessageSender] -- ^ List of message senders
    }
  deriving (Eq)

instance Show MessageSenders where
  show MessageSenders
    { total_count = total_count_
    , senders     = senders_
    }
      = "MessageSenders"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "senders"     `I.p` senders_
        ]

instance AT.FromJSON MessageSenders where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSenders" -> parseMessageSenders v
      _                -> mempty
    
    where
      parseMessageSenders :: A.Value -> AT.Parser MessageSenders
      parseMessageSenders = A.withObject "MessageSenders" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        senders_     <- o A..:?  "senders"
        pure $ MessageSenders
          { total_count = total_count_
          , senders     = senders_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageSenders where
  toJSON MessageSenders
    { total_count = total_count_
    , senders     = senders_
    }
      = A.object
        [ "@type"       A..= AT.String "messageSenders"
        , "total_count" A..= total_count_
        , "senders"     A..= senders_
        ]

defaultMessageSenders :: MessageSenders
defaultMessageSenders =
  MessageSenders
    { total_count = Nothing
    , senders     = Nothing
    }

