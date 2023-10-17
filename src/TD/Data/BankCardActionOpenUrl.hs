module TD.Data.BankCardActionOpenUrl
  (BankCardActionOpenUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data BankCardActionOpenUrl
  = BankCardActionOpenUrl -- ^ Describes an action associated with a bank card number
    { text :: Maybe T.Text -- ^ Action text
    , url  :: Maybe T.Text -- ^ The URL to be opened
    }
  deriving (Eq, Show)

instance I.ShortShow BankCardActionOpenUrl where
  shortShow BankCardActionOpenUrl
    { text = text_
    , url  = url_
    }
      = "BankCardActionOpenUrl"
        ++ I.cc
        [ "text" `I.p` text_
        , "url"  `I.p` url_
        ]

instance AT.FromJSON BankCardActionOpenUrl where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "bankCardActionOpenUrl" -> parseBankCardActionOpenUrl v
      _                       -> mempty
    
    where
      parseBankCardActionOpenUrl :: A.Value -> AT.Parser BankCardActionOpenUrl
      parseBankCardActionOpenUrl = A.withObject "BankCardActionOpenUrl" $ \o -> do
        text_ <- o A..:?  "text"
        url_  <- o A..:?  "url"
        pure $ BankCardActionOpenUrl
          { text = text_
          , url  = url_
          }
  parseJSON _ = mempty

