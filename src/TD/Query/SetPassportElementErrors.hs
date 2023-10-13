module TD.Query.SetPassportElementErrors(SetPassportElementErrors(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPassportElementError as InputPassportElementError

data SetPassportElementErrors -- ^ Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed
  = SetPassportElementErrors
    { user_id :: Maybe Int                                                   -- ^ User identifier
    , errors  :: Maybe [InputPassportElementError.InputPassportElementError] -- ^ The errors
    }
  deriving (Eq)

instance Show SetPassportElementErrors where
  show
    SetPassportElementErrors
      { user_id = user_id_
      , errors  = errors_
      }
        = "SetPassportElementErrors"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "errors"  `I.p` errors_
          ]

instance AT.ToJSON SetPassportElementErrors where
  toJSON
    SetPassportElementErrors
      { user_id = user_id_
      , errors  = errors_
      }
        = A.object
          [ "@type"   A..= AT.String "setPassportElementErrors"
          , "user_id" A..= user_id_
          , "errors"  A..= errors_
          ]
