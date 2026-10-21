module TD.Data.TonConnectConnectData
  ( TonConnectConnectData(..)    
  , defaultTonConnectConnectData 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified TD.Data.TonWalletOwnershipProof as TonWalletOwnershipProof

data TonConnectConnectData
  = TonConnectConnectData -- ^ Contains data required to give access to the TON wallet of the current user in acceptOauthRequest
    { session_id       :: Maybe Int                                             -- ^ Unique identifier of the session
    , challenge_answer :: Maybe BS.ByteString                                   -- ^ Answer to the challenge received from setTonConnectSessionWalletClientId
    , body             :: Maybe BS.ByteString                                   -- ^ Body of the result of the connection request as in sendTonConnectSessionConnectResult
    , proof            :: Maybe TonWalletOwnershipProof.TonWalletOwnershipProof -- ^ Proof of the TON wallet ownership for the payload oauthLinkInfo.ton_proof_payload
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectConnectData where
  shortShow TonConnectConnectData
    { session_id       = session_id_
    , challenge_answer = challenge_answer_
    , body             = body_
    , proof            = proof_
    }
      = "TonConnectConnectData"
        ++ I.cc
        [ "session_id"       `I.p` session_id_
        , "challenge_answer" `I.p` challenge_answer_
        , "body"             `I.p` body_
        , "proof"            `I.p` proof_
        ]

instance AT.FromJSON TonConnectConnectData where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectConnectData" -> parseTonConnectConnectData v
      _                       -> mempty
    
    where
      parseTonConnectConnectData :: A.Value -> AT.Parser TonConnectConnectData
      parseTonConnectConnectData = A.withObject "TonConnectConnectData" $ \o -> do
        session_id_       <- fmap I.readInt64 <$> o A..:?  "session_id"
        challenge_answer_ <- fmap I.readBytes <$> o A..:?  "challenge_answer"
        body_             <- fmap I.readBytes <$> o A..:?  "body"
        proof_            <- o A..:?                       "proof"
        pure $ TonConnectConnectData
          { session_id       = session_id_
          , challenge_answer = challenge_answer_
          , body             = body_
          , proof            = proof_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonConnectConnectData where
  toJSON TonConnectConnectData
    { session_id       = session_id_
    , challenge_answer = challenge_answer_
    , body             = body_
    , proof            = proof_
    }
      = A.object
        [ "@type"            A..= AT.String "tonConnectConnectData"
        , "session_id"       A..= fmap I.writeInt64  session_id_
        , "challenge_answer" A..= fmap I.writeBytes  challenge_answer_
        , "body"             A..= fmap I.writeBytes  body_
        , "proof"            A..= proof_
        ]

defaultTonConnectConnectData :: TonConnectConnectData
defaultTonConnectConnectData =
  TonConnectConnectData
    { session_id       = Nothing
    , challenge_answer = Nothing
    , body             = Nothing
    , proof            = Nothing
    }

