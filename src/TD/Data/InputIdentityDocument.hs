{-# LANGUAGE OverloadedStrings #-}

module TD.Data.InputIdentityDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Date as Date
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

data InputIdentityDocument = -- | An identity document to be saved to Telegram Passport @number Document number; 1-24 characters @expiry_date Document expiry date; pass null if not applicable @front_side Front side of the document
  InputIdentityDocument
  { -- |
    translation :: Maybe [InputFile.InputFile],
    -- |
    selfie :: Maybe InputFile.InputFile,
    -- | Reverse side of the document; only for driver license and identity card; pass null otherwise @selfie Selfie with the document; pass null if unavailable @translation List of files containing a certified English translation of the document
    reverse_side :: Maybe InputFile.InputFile,
    -- |
    front_side :: Maybe InputFile.InputFile,
    -- |
    expiry_date :: Maybe Date.Date,
    -- |
    number :: Maybe String
  }
  deriving (Eq)

instance Show InputIdentityDocument where
  show
    InputIdentityDocument
      { translation = translation,
        selfie = selfie,
        reverse_side = reverse_side,
        front_side = front_side,
        expiry_date = expiry_date,
        number = number
      } =
      "InputIdentityDocument"
        ++ U.cc
          [ U.p "translation" translation,
            U.p "selfie" selfie,
            U.p "reverse_side" reverse_side,
            U.p "front_side" front_side,
            U.p "expiry_date" expiry_date,
            U.p "number" number
          ]

instance T.FromJSON InputIdentityDocument where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputIdentityDocument" -> parseInputIdentityDocument v
      _ -> mempty
    where
      parseInputIdentityDocument :: A.Value -> T.Parser InputIdentityDocument
      parseInputIdentityDocument = A.withObject "InputIdentityDocument" $ \o -> do
        translation_ <- o A..:? "translation"
        selfie_ <- o A..:? "selfie"
        reverse_side_ <- o A..:? "reverse_side"
        front_side_ <- o A..:? "front_side"
        expiry_date_ <- o A..:? "expiry_date"
        number_ <- o A..:? "number"
        return $ InputIdentityDocument {translation = translation_, selfie = selfie_, reverse_side = reverse_side_, front_side = front_side_, expiry_date = expiry_date_, number = number_}
  parseJSON _ = mempty

instance T.ToJSON InputIdentityDocument where
  toJSON
    InputIdentityDocument
      { translation = translation,
        selfie = selfie,
        reverse_side = reverse_side,
        front_side = front_side,
        expiry_date = expiry_date,
        number = number
      } =
      A.object
        [ "@type" A..= T.String "inputIdentityDocument",
          "translation" A..= translation,
          "selfie" A..= selfie,
          "reverse_side" A..= reverse_side,
          "front_side" A..= front_side,
          "expiry_date" A..= expiry_date,
          "number" A..= number
        ]
