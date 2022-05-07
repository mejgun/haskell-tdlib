{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetPassportElementErrors where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputPassportElementError as InputPassportElementError
import qualified Utils as U

-- |
-- Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed @user_id User identifier @errors The errors
data SetPassportElementErrors = SetPassportElementErrors
  { -- |
    errors :: Maybe [InputPassportElementError.InputPassportElementError],
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetPassportElementErrors where
  show
    SetPassportElementErrors
      { errors = errors,
        user_id = user_id
      } =
      "SetPassportElementErrors"
        ++ U.cc
          [ U.p "errors" errors,
            U.p "user_id" user_id
          ]

instance T.ToJSON SetPassportElementErrors where
  toJSON
    SetPassportElementErrors
      { errors = errors,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "setPassportElementErrors",
          "errors" A..= errors,
          "user_id" A..= user_id
        ]
