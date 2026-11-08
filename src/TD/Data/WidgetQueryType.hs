module TD.Data.WidgetQueryType
  (WidgetQueryType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WidgetQueryWallet as WidgetQueryWallet
import qualified Data.Text as T

-- | Describes type of a widget query
data WidgetQueryType
  = WidgetQueryTypeData -- ^ The query contains data for the bot
    { with_wallet :: Maybe Bool -- ^ True, if the TON wallet card of the user who sends the query is sent to the bot along with the query
    }
  | WidgetQueryTypeSignData -- ^ The query contains data signed by a TON wallet of the user who sends the query
    { wallet    :: Maybe WidgetQueryWallet.WidgetQueryWallet -- ^ The wallet that signed the data
    , sign_data :: Maybe T.Text                              -- ^ JSON-serialized signed data
    }
  | WidgetQueryTypeSentTransaction -- ^ The query notifies the bot about a transaction sent from a TON wallet of the user who sends the query
    { wallet   :: Maybe WidgetQueryWallet.WidgetQueryWallet -- ^ The wallet from which the transaction was sent
    , msg_hash :: Maybe T.Text                              -- ^ Value of msg_hash of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow WidgetQueryType where
  shortShow WidgetQueryTypeData
    { with_wallet = with_wallet_
    }
      = "WidgetQueryTypeData"
        ++ I.cc
        [ "with_wallet" `I.p` with_wallet_
        ]
  shortShow WidgetQueryTypeSignData
    { wallet    = wallet_
    , sign_data = sign_data_
    }
      = "WidgetQueryTypeSignData"
        ++ I.cc
        [ "wallet"    `I.p` wallet_
        , "sign_data" `I.p` sign_data_
        ]
  shortShow WidgetQueryTypeSentTransaction
    { wallet   = wallet_
    , msg_hash = msg_hash_
    }
      = "WidgetQueryTypeSentTransaction"
        ++ I.cc
        [ "wallet"   `I.p` wallet_
        , "msg_hash" `I.p` msg_hash_
        ]

instance AT.FromJSON WidgetQueryType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "widgetQueryTypeData"            -> parseWidgetQueryTypeData v
      "widgetQueryTypeSignData"        -> parseWidgetQueryTypeSignData v
      "widgetQueryTypeSentTransaction" -> parseWidgetQueryTypeSentTransaction v
      _                                -> mempty
    
    where
      parseWidgetQueryTypeData :: A.Value -> AT.Parser WidgetQueryType
      parseWidgetQueryTypeData = A.withObject "WidgetQueryTypeData" $ \o -> do
        with_wallet_ <- o A..:?  "with_wallet"
        pure $ WidgetQueryTypeData
          { with_wallet = with_wallet_
          }
      parseWidgetQueryTypeSignData :: A.Value -> AT.Parser WidgetQueryType
      parseWidgetQueryTypeSignData = A.withObject "WidgetQueryTypeSignData" $ \o -> do
        wallet_    <- o A..:?  "wallet"
        sign_data_ <- o A..:?  "sign_data"
        pure $ WidgetQueryTypeSignData
          { wallet    = wallet_
          , sign_data = sign_data_
          }
      parseWidgetQueryTypeSentTransaction :: A.Value -> AT.Parser WidgetQueryType
      parseWidgetQueryTypeSentTransaction = A.withObject "WidgetQueryTypeSentTransaction" $ \o -> do
        wallet_   <- o A..:?  "wallet"
        msg_hash_ <- o A..:?  "msg_hash"
        pure $ WidgetQueryTypeSentTransaction
          { wallet   = wallet_
          , msg_hash = msg_hash_
          }
  parseJSON _ = mempty

instance AT.ToJSON WidgetQueryType where
  toJSON WidgetQueryTypeData
    { with_wallet = with_wallet_
    }
      = A.object
        [ "@type"       A..= AT.String "widgetQueryTypeData"
        , "with_wallet" A..= with_wallet_
        ]
  toJSON WidgetQueryTypeSignData
    { wallet    = wallet_
    , sign_data = sign_data_
    }
      = A.object
        [ "@type"     A..= AT.String "widgetQueryTypeSignData"
        , "wallet"    A..= wallet_
        , "sign_data" A..= sign_data_
        ]
  toJSON WidgetQueryTypeSentTransaction
    { wallet   = wallet_
    , msg_hash = msg_hash_
    }
      = A.object
        [ "@type"    A..= AT.String "widgetQueryTypeSentTransaction"
        , "wallet"   A..= wallet_
        , "msg_hash" A..= msg_hash_
        ]

