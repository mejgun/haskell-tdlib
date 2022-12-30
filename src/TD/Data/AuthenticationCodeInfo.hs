{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AuthenticationCodeType as AuthenticationCodeType
import qualified Utils as U

-- |
data AuthenticationCodeInfo = -- | Information about the authentication code that was sent
  AuthenticationCodeInfo
  { -- | Timeout before the code can be re-sent, in seconds
    timeout :: Maybe Int,
    -- | The way the next code will be sent to the user; may be null
    next_type :: Maybe AuthenticationCodeType.AuthenticationCodeType,
    -- | The way the code was sent to the user
    _type :: Maybe AuthenticationCodeType.AuthenticationCodeType,
    -- | A phone number that is being authenticated
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show AuthenticationCodeInfo where
  show
    AuthenticationCodeInfo
      { timeout = timeout_,
        next_type = next_type_,
        _type = _type_,
        phone_number = phone_number_
      } =
      "AuthenticationCodeInfo"
        ++ U.cc
          [ U.p "timeout" timeout_,
            U.p "next_type" next_type_,
            U.p "_type" _type_,
            U.p "phone_number" phone_number_
          ]

instance T.FromJSON AuthenticationCodeInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
      _ -> mempty
    where
      parseAuthenticationCodeInfo :: A.Value -> T.Parser AuthenticationCodeInfo
      parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
        timeout_ <- o A..:? "timeout"
        next_type_ <- o A..:? "next_type"
        _type_ <- o A..:? "type"
        phone_number_ <- o A..:? "phone_number"
        return $ AuthenticationCodeInfo {timeout = timeout_, next_type = next_type_, _type = _type_, phone_number = phone_number_}
  parseJSON _ = mempty

instance T.ToJSON AuthenticationCodeInfo where
  toJSON
    AuthenticationCodeInfo
      { timeout = timeout_,
        next_type = next_type_,
        _type = _type_,
        phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeInfo",
          "timeout" A..= timeout_,
          "next_type" A..= next_type_,
          "type" A..= _type_,
          "phone_number" A..= phone_number_
        ]
