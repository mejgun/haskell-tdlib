module TD.Data.WalletBotBalance
  (WalletBotBalance(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WalletBotBalance
  = WalletBotBalance -- ^ Describes balance of the current user in the bot https://t.me/walt
    { has_balance :: Maybe Bool   -- ^ True, if the user has positive TON Gram balance
    , url         :: Maybe T.Text -- ^ The URL to open to launch the bot; may be empty if none
    }
  deriving (Eq, Show)

instance I.ShortShow WalletBotBalance where
  shortShow WalletBotBalance
    { has_balance = has_balance_
    , url         = url_
    }
      = "WalletBotBalance"
        ++ I.cc
        [ "has_balance" `I.p` has_balance_
        , "url"         `I.p` url_
        ]

instance AT.FromJSON WalletBotBalance where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "walletBotBalance" -> parseWalletBotBalance v
      _                  -> mempty
    
    where
      parseWalletBotBalance :: A.Value -> AT.Parser WalletBotBalance
      parseWalletBotBalance = A.withObject "WalletBotBalance" $ \o -> do
        has_balance_ <- o A..:?  "has_balance"
        url_         <- o A..:?  "url"
        pure $ WalletBotBalance
          { has_balance = has_balance_
          , url         = url_
          }
  parseJSON _ = mempty

