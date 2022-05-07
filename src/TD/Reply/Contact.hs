{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Contact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { user_id = user_id,
        vcard = vcard,
        last_name = last_name,
        first_name = first_name,
        phone_number = phone_number
      } =
      "Contact"
        ++ U.cc
          [ U.p "user_id" user_id,
            U.p "vcard" vcard,
            U.p "last_name" last_name,
            U.p "first_name" first_name,
            U.p "phone_number" phone_number
          ]

instance T.FromJSON Contact where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "contact" -> parseContact v
      _ -> fail ""
    where
      parseContact :: A.Value -> T.Parser Contact
      parseContact = A.withObject "Contact" $ \o -> do
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        vcard_ <- o A..:? "vcard"
        last_name_ <- o A..:? "last_name"
        first_name_ <- o A..:? "first_name"
        phone_number_ <- o A..:? "phone_number"
        return $ Contact {user_id = user_id_, vcard = vcard_, last_name = last_name_, first_name = first_name_, phone_number = phone_number_}
  parseJSON _ = fail ""

instance T.ToJSON Contact where
  toJSON
    Contact
      { user_id = user_id,
        vcard = vcard,
        last_name = last_name,
        first_name = first_name,
        phone_number = phone_number
      } =
      A.object
        [ "@type" A..= T.String "contact",
          "user_id" A..= user_id,
          "vcard" A..= vcard,
          "last_name" A..= last_name,
          "first_name" A..= first_name,
          "phone_number" A..= phone_number
        ]
