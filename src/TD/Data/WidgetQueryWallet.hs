module TD.Data.WidgetQueryWallet
  ( WidgetQueryWallet(..)    
  , defaultWidgetQueryWallet 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

data WidgetQueryWallet
  = WidgetQueryWallet -- ^ Describes a TON wallet of the user, who is used in a widget query
    { address     :: Maybe T.Text        -- ^ Address of the wallet
    , gram_amount :: Maybe Int           -- ^ Balance of the wallet, in the smallest units of the cryptocurrency
    , public_key  :: Maybe BS.ByteString -- ^ Public key of the wallet; may be empty if unknown
    , state_init  :: Maybe BS.ByteString -- ^ Serialized StateInit of the wallet contract; must be empty if and only if public_key is empty
    }
  deriving (Eq, Show)

instance I.ShortShow WidgetQueryWallet where
  shortShow WidgetQueryWallet
    { address     = address_
    , gram_amount = gram_amount_
    , public_key  = public_key_
    , state_init  = state_init_
    }
      = "WidgetQueryWallet"
        ++ I.cc
        [ "address"     `I.p` address_
        , "gram_amount" `I.p` gram_amount_
        , "public_key"  `I.p` public_key_
        , "state_init"  `I.p` state_init_
        ]

instance AT.FromJSON WidgetQueryWallet where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "widgetQueryWallet" -> parseWidgetQueryWallet v
      _                   -> mempty
    
    where
      parseWidgetQueryWallet :: A.Value -> AT.Parser WidgetQueryWallet
      parseWidgetQueryWallet = A.withObject "WidgetQueryWallet" $ \o -> do
        address_     <- o A..:?                       "address"
        gram_amount_ <- fmap I.readInt64 <$> o A..:?  "gram_amount"
        public_key_  <- fmap I.readBytes <$> o A..:?  "public_key"
        state_init_  <- fmap I.readBytes <$> o A..:?  "state_init"
        pure $ WidgetQueryWallet
          { address     = address_
          , gram_amount = gram_amount_
          , public_key  = public_key_
          , state_init  = state_init_
          }
  parseJSON _ = mempty

instance AT.ToJSON WidgetQueryWallet where
  toJSON WidgetQueryWallet
    { address     = address_
    , gram_amount = gram_amount_
    , public_key  = public_key_
    , state_init  = state_init_
    }
      = A.object
        [ "@type"       A..= AT.String "widgetQueryWallet"
        , "address"     A..= address_
        , "gram_amount" A..= fmap I.writeInt64  gram_amount_
        , "public_key"  A..= fmap I.writeBytes  public_key_
        , "state_init"  A..= fmap I.writeBytes  state_init_
        ]

defaultWidgetQueryWallet :: WidgetQueryWallet
defaultWidgetQueryWallet =
  WidgetQueryWallet
    { address     = Nothing
    , gram_amount = Nothing
    , public_key  = Nothing
    , state_init  = Nothing
    }

