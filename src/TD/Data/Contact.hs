{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Contact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Contact = -- | Describes a user contact @phone_number Phone number of the user @first_name First name of the user; 1-255 characters in length @last_name Last name of the user @vcard Additional data about the user in a form of vCard; 0-2048 bytes in length @user_id Identifier of the user, if known; otherwise 0
  Contact
  { -- |
    user_id :: Maybe Int,
    -- |
    vcard :: Maybe String,
    -- |
    last_name :: Maybe String,
    -- |
    first_name :: Maybe String,
    -- |
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show Contact where
  show
    Contact
      { user_id = user_id_,
        vcard = vcard_,
        last_name = last_name_,
        first_name = first_name_,
        phone_number = phone_number_
      } =
      "Contact"
        ++ U.cc
          [ U.p "user_id" user_id_,
            U.p "vcard" vcard_,
            U.p "last_name" last_name_,
            U.p "first_name" first_name_,
            U.p "phone_number" phone_number_
          ]

instance T.FromJSON Contact where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "contact" -> parseContact v
      _ -> mempty
    where
      parseContact :: A.Value -> T.Parser Contact
      parseContact = A.withObject "Contact" $ \o -> do
        user_id_ <- o A..:? "user_id"
        vcard_ <- o A..:? "vcard"
        last_name_ <- o A..:? "last_name"
        first_name_ <- o A..:? "first_name"
        phone_number_ <- o A..:? "phone_number"
        return $ Contact {user_id = user_id_, vcard = vcard_, last_name = last_name_, first_name = first_name_, phone_number = phone_number_}
  parseJSON _ = mempty

instance T.ToJSON Contact where
  toJSON
    Contact
      { user_id = user_id_,
        vcard = vcard_,
        last_name = last_name_,
        first_name = first_name_,
        phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "contact",
          "user_id" A..= user_id_,
          "vcard" A..= vcard_,
          "last_name" A..= last_name_,
          "first_name" A..= first_name_,
          "phone_number" A..= phone_number_
        ]
