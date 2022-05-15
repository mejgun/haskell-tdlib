{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmailAddressAuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data EmailAddressAuthenticationCodeInfo = -- | Information about the email address authentication code that was sent @email_address_pattern Pattern of the email address to which an authentication code was sent @length Length of the code; 0 if unknown
  EmailAddressAuthenticationCodeInfo
  { -- |
    _length :: Maybe Int,
    -- |
    email_address_pattern :: Maybe String
  }
  deriving (Eq)

instance Show EmailAddressAuthenticationCodeInfo where
  show
    EmailAddressAuthenticationCodeInfo
      { _length = _length_,
        email_address_pattern = email_address_pattern_
      } =
      "EmailAddressAuthenticationCodeInfo"
        ++ U.cc
          [ U.p "_length" _length_,
            U.p "email_address_pattern" email_address_pattern_
          ]

instance T.FromJSON EmailAddressAuthenticationCodeInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emailAddressAuthenticationCodeInfo" -> parseEmailAddressAuthenticationCodeInfo v
      _ -> mempty
    where
      parseEmailAddressAuthenticationCodeInfo :: A.Value -> T.Parser EmailAddressAuthenticationCodeInfo
      parseEmailAddressAuthenticationCodeInfo = A.withObject "EmailAddressAuthenticationCodeInfo" $ \o -> do
        _length_ <- o A..:? "length"
        email_address_pattern_ <- o A..:? "email_address_pattern"
        return $ EmailAddressAuthenticationCodeInfo {_length = _length_, email_address_pattern = email_address_pattern_}
  parseJSON _ = mempty

instance T.ToJSON EmailAddressAuthenticationCodeInfo where
  toJSON
    EmailAddressAuthenticationCodeInfo
      { _length = _length_,
        email_address_pattern = email_address_pattern_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressAuthenticationCodeInfo",
          "length" A..= _length_,
          "email_address_pattern" A..= email_address_pattern_
        ]
