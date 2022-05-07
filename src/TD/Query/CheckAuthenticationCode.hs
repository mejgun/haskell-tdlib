{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode @code Authentication code to check
data CheckAuthenticationCode = CheckAuthenticationCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckAuthenticationCode where
  show
    CheckAuthenticationCode
      { code = code
      } =
      "CheckAuthenticationCode"
        ++ U.cc
          [ U.p "code" code
          ]

instance T.ToJSON CheckAuthenticationCode where
  toJSON
    CheckAuthenticationCode
      { code = code
      } =
      A.object
        [ "@type" A..= T.String "checkAuthenticationCode",
          "code" A..= code
        ]
