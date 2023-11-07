module TD.Query.CheckPremiumGiftCode
  (CheckPremiumGiftCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Return information about a Telegram Premium gift code. Returns 'TD.Data.PremiumGiftCodeInfo.PremiumGiftCodeInfo'
data CheckPremiumGiftCode
  = CheckPremiumGiftCode
    { code :: Maybe T.Text -- ^ The code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckPremiumGiftCode where
  shortShow
    CheckPremiumGiftCode
      { code = code_
      }
        = "CheckPremiumGiftCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckPremiumGiftCode where
  toJSON
    CheckPremiumGiftCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkPremiumGiftCode"
          , "code"  A..= code_
          ]

