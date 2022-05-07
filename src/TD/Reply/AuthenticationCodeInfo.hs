{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.AuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.AuthenticationCodeType as AuthenticationCodeType
import qualified Utils as U

data AuthenticationCodeInfo = -- | Information about the authentication code that was sent @phone_number A phone number that is being authenticated @type The way the code was sent to the user @next_type The way the next code will be sent to the user; may be null @timeout Timeout before the code can be re-sent, in seconds
  AuthenticationCodeInfo
  { -- |
    timeout :: Maybe Int,
    -- |
    next_type :: Maybe AuthenticationCodeType.AuthenticationCodeType,
    -- |
    _type :: Maybe AuthenticationCodeType.AuthenticationCodeType,
    -- |
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show AuthenticationCodeInfo where
  show
    AuthenticationCodeInfo
      { timeout = timeout,
        next_type = next_type,
        _type = _type,
        phone_number = phone_number
      } =
      "AuthenticationCodeInfo"
        ++ U.cc
          [ U.p "timeout" timeout,
            U.p "next_type" next_type,
            U.p "_type" _type,
            U.p "phone_number" phone_number
          ]

instance T.FromJSON AuthenticationCodeInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "authenticationCodeInfo" -> parseAuthenticationCodeInfo v
      _ -> fail ""
    where
      parseAuthenticationCodeInfo :: A.Value -> T.Parser AuthenticationCodeInfo
      parseAuthenticationCodeInfo = A.withObject "AuthenticationCodeInfo" $ \o -> do
        timeout_ <- mconcat [o A..:? "timeout", U.rm <$> (o A..: "timeout" :: T.Parser String)] :: T.Parser (Maybe Int)
        next_type_ <- o A..:? "next_type"
        _type_ <- o A..:? "type"
        phone_number_ <- o A..:? "phone_number"
        return $ AuthenticationCodeInfo {timeout = timeout_, next_type = next_type_, _type = _type_, phone_number = phone_number_}
  parseJSON _ = fail ""

instance T.ToJSON AuthenticationCodeInfo where
  toJSON
    AuthenticationCodeInfo
      { timeout = timeout,
        next_type = next_type,
        _type = _type,
        phone_number = phone_number
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeInfo",
          "timeout" A..= timeout,
          "next_type" A..= next_type,
          "type" A..= _type,
          "phone_number" A..= phone_number
        ]
