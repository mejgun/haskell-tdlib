module TD.Data.UserTonWalletAddress
  (UserTonWalletAddress(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

data UserTonWalletAddress
  = UserTonWalletAddress -- ^ Contains TON wallet address of a user
    { user_id        :: Maybe Int           -- ^ Identifier of the user; 0 if unknown
    , wallet_address :: Maybe T.Text        -- ^ Address of the user's wallet in the TON blockchain
    , public_key     :: Maybe BS.ByteString -- ^ Public key of the user
    }
  deriving (Eq, Show)

instance I.ShortShow UserTonWalletAddress where
  shortShow UserTonWalletAddress
    { user_id        = user_id_
    , wallet_address = wallet_address_
    , public_key     = public_key_
    }
      = "UserTonWalletAddress"
        ++ I.cc
        [ "user_id"        `I.p` user_id_
        , "wallet_address" `I.p` wallet_address_
        , "public_key"     `I.p` public_key_
        ]

instance AT.FromJSON UserTonWalletAddress where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userTonWalletAddress" -> parseUserTonWalletAddress v
      _                      -> mempty
    
    where
      parseUserTonWalletAddress :: A.Value -> AT.Parser UserTonWalletAddress
      parseUserTonWalletAddress = A.withObject "UserTonWalletAddress" $ \o -> do
        user_id_        <- o A..:?                       "user_id"
        wallet_address_ <- o A..:?                       "wallet_address"
        public_key_     <- fmap I.readBytes <$> o A..:?  "public_key"
        pure $ UserTonWalletAddress
          { user_id        = user_id_
          , wallet_address = wallet_address_
          , public_key     = public_key_
          }
  parseJSON _ = mempty

