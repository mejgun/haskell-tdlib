{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.IdentityDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Date as Date
import qualified TD.Data.DatedFile as DatedFile
import qualified Utils as U

-- |
data IdentityDocument = -- | An identity document @number Document number; 1-24 characters @expiry_date Document expiry date; may be null if not applicable @front_side Front side of the document
  IdentityDocument
  { -- |
    translation :: Maybe [DatedFile.DatedFile],
    -- |
    selfie :: Maybe DatedFile.DatedFile,
    -- | Reverse side of the document; only for driver license and identity card; may be null @selfie Selfie with the document; may be null @translation List of files containing a certified English translation of the document
    reverse_side :: Maybe DatedFile.DatedFile,
    -- |
    front_side :: Maybe DatedFile.DatedFile,
    -- |
    expiry_date :: Maybe Date.Date,
    -- |
    number :: Maybe String
  }
  deriving (Eq)

instance Show IdentityDocument where
  show
    IdentityDocument
      { translation = translation_,
        selfie = selfie_,
        reverse_side = reverse_side_,
        front_side = front_side_,
        expiry_date = expiry_date_,
        number = number_
      } =
      "IdentityDocument"
        ++ U.cc
          [ U.p "translation" translation_,
            U.p "selfie" selfie_,
            U.p "reverse_side" reverse_side_,
            U.p "front_side" front_side_,
            U.p "expiry_date" expiry_date_,
            U.p "number" number_
          ]

instance T.FromJSON IdentityDocument where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "identityDocument" -> parseIdentityDocument v
      _ -> mempty
    where
      parseIdentityDocument :: A.Value -> T.Parser IdentityDocument
      parseIdentityDocument = A.withObject "IdentityDocument" $ \o -> do
        translation_ <- o A..:? "translation"
        selfie_ <- o A..:? "selfie"
        reverse_side_ <- o A..:? "reverse_side"
        front_side_ <- o A..:? "front_side"
        expiry_date_ <- o A..:? "expiry_date"
        number_ <- o A..:? "number"
        return $ IdentityDocument {translation = translation_, selfie = selfie_, reverse_side = reverse_side_, front_side = front_side_, expiry_date = expiry_date_, number = number_}
  parseJSON _ = mempty

instance T.ToJSON IdentityDocument where
  toJSON
    IdentityDocument
      { translation = translation_,
        selfie = selfie_,
        reverse_side = reverse_side_,
        front_side = front_side_,
        expiry_date = expiry_date_,
        number = number_
      } =
      A.object
        [ "@type" A..= T.String "identityDocument",
          "translation" A..= translation_,
          "selfie" A..= selfie_,
          "reverse_side" A..= reverse_side_,
          "front_side" A..= front_side_,
          "expiry_date" A..= expiry_date_,
          "number" A..= number_
        ]
