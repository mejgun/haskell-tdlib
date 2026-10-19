module TD.Data.TonConnectChallenge
  (TonConnectChallenge(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data TonConnectChallenge
  = TonConnectChallenge -- ^ Represents a TON Connect challenge
    { challenge :: Maybe BS.ByteString -- ^ 104-byte challenge
    , event_id  :: Maybe Int           -- ^ Unique identifier of the first outgoing event
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectChallenge where
  shortShow TonConnectChallenge
    { challenge = challenge_
    , event_id  = event_id_
    }
      = "TonConnectChallenge"
        ++ I.cc
        [ "challenge" `I.p` challenge_
        , "event_id"  `I.p` event_id_
        ]

instance AT.FromJSON TonConnectChallenge where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectChallenge" -> parseTonConnectChallenge v
      _                     -> mempty
    
    where
      parseTonConnectChallenge :: A.Value -> AT.Parser TonConnectChallenge
      parseTonConnectChallenge = A.withObject "TonConnectChallenge" $ \o -> do
        challenge_ <- fmap I.readBytes <$> o A..:?  "challenge"
        event_id_  <- fmap I.readInt64 <$> o A..:?  "event_id"
        pure $ TonConnectChallenge
          { challenge = challenge_
          , event_id  = event_id_
          }
  parseJSON _ = mempty

