module TD.Data.BankCardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.BankCardActionOpenUrl as BankCardActionOpenUrl

data BankCardInfo
  = BankCardInfo -- ^ Information about a bank card
    { title   :: Maybe T.Text                                        -- ^ Title of the bank card description
    , actions :: Maybe [BankCardActionOpenUrl.BankCardActionOpenUrl] -- ^ Actions that can be done with the bank card number
    }
  deriving (Eq)

instance Show BankCardInfo where
  show BankCardInfo
    { title   = title_
    , actions = actions_
    }
      = "BankCardInfo"
        ++ I.cc
        [ "title"   `I.p` title_
        , "actions" `I.p` actions_
        ]

instance AT.FromJSON BankCardInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "bankCardInfo" -> parseBankCardInfo v
      _              -> mempty
    
    where
      parseBankCardInfo :: A.Value -> AT.Parser BankCardInfo
      parseBankCardInfo = A.withObject "BankCardInfo" $ \o -> do
        title_   <- o A..:?  "title"
        actions_ <- o A..:?  "actions"
        pure $ BankCardInfo
          { title   = title_
          , actions = actions_
          }

instance AT.ToJSON BankCardInfo where
  toJSON BankCardInfo
    { title   = title_
    , actions = actions_
    }
      = A.object
        [ "@type"   A..= AT.String "bankCardInfo"
        , "title"   A..= title_
        , "actions" A..= actions_
        ]
