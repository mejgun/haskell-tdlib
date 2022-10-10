{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmailAddressAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains authentication data for a email address
data EmailAddressAuthentication
  = -- | An authentication code delivered to a user's email address @code The code
    EmailAddressAuthenticationCode
      { -- |
        code :: Maybe String
      }
  | -- | An authentication token received through Apple ID @token The token
    EmailAddressAuthenticationAppleId
      { -- |
        token :: Maybe String
      }
  | -- | An authentication token received through Google ID @token The token
    EmailAddressAuthenticationGoogleId
      { -- |
        token :: Maybe String
      }
  deriving (Eq)

instance Show EmailAddressAuthentication where
  show
    EmailAddressAuthenticationCode
      { code = code_
      } =
      "EmailAddressAuthenticationCode"
        ++ U.cc
          [ U.p "code" code_
          ]
  show
    EmailAddressAuthenticationAppleId
      { token = token_
      } =
      "EmailAddressAuthenticationAppleId"
        ++ U.cc
          [ U.p "token" token_
          ]
  show
    EmailAddressAuthenticationGoogleId
      { token = token_
      } =
      "EmailAddressAuthenticationGoogleId"
        ++ U.cc
          [ U.p "token" token_
          ]

instance T.FromJSON EmailAddressAuthentication where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emailAddressAuthenticationCode" -> parseEmailAddressAuthenticationCode v
      "emailAddressAuthenticationAppleId" -> parseEmailAddressAuthenticationAppleId v
      "emailAddressAuthenticationGoogleId" -> parseEmailAddressAuthenticationGoogleId v
      _ -> mempty
    where
      parseEmailAddressAuthenticationCode :: A.Value -> T.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationCode = A.withObject "EmailAddressAuthenticationCode" $ \o -> do
        code_ <- o A..:? "code"
        return $ EmailAddressAuthenticationCode {code = code_}

      parseEmailAddressAuthenticationAppleId :: A.Value -> T.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationAppleId = A.withObject "EmailAddressAuthenticationAppleId" $ \o -> do
        token_ <- o A..:? "token"
        return $ EmailAddressAuthenticationAppleId {token = token_}

      parseEmailAddressAuthenticationGoogleId :: A.Value -> T.Parser EmailAddressAuthentication
      parseEmailAddressAuthenticationGoogleId = A.withObject "EmailAddressAuthenticationGoogleId" $ \o -> do
        token_ <- o A..:? "token"
        return $ EmailAddressAuthenticationGoogleId {token = token_}
  parseJSON _ = mempty

instance T.ToJSON EmailAddressAuthentication where
  toJSON
    EmailAddressAuthenticationCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressAuthenticationCode",
          "code" A..= code_
        ]
  toJSON
    EmailAddressAuthenticationAppleId
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressAuthenticationAppleId",
          "token" A..= token_
        ]
  toJSON
    EmailAddressAuthenticationGoogleId
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressAuthenticationGoogleId",
          "token" A..= token_
        ]
