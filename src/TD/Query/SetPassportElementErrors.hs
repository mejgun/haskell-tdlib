module TD.Query.SetPassportElementErrors
  (SetPassportElementErrors(..)
  , defaultSetPassportElementErrors
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPassportElementError as InputPassportElementError

-- | Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed. Returns 'TD.Data.Ok.Ok'
data SetPassportElementErrors
  = SetPassportElementErrors
    { user_id :: Maybe Int                                                   -- ^ User identifier
    , errors  :: Maybe [InputPassportElementError.InputPassportElementError] -- ^ The errors
    }
  deriving (Eq, Show)

instance I.ShortShow SetPassportElementErrors where
  shortShow
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

defaultSetPassportElementErrors :: SetPassportElementErrors
defaultSetPassportElementErrors =
  SetPassportElementErrors
    { user_id = Nothing
    , errors  = Nothing
    }

