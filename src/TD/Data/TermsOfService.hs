{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TermsOfService where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
data TermsOfService = -- | Contains Telegram terms of service @text Text of the terms of service @min_user_age The minimum age of a user to be able to accept the terms; 0 if age isn't restricted @show_popup True, if a blocking popup with terms of service must be shown to the user
  TermsOfService
  { -- |
    show_popup :: Maybe Bool,
    -- |
    min_user_age :: Maybe Int,
    -- |
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show TermsOfService where
  show
    TermsOfService
      { show_popup = show_popup_,
        min_user_age = min_user_age_,
        text = text_
      } =
      "TermsOfService"
        ++ U.cc
          [ U.p "show_popup" show_popup_,
            U.p "min_user_age" min_user_age_,
            U.p "text" text_
          ]

instance T.FromJSON TermsOfService where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "termsOfService" -> parseTermsOfService v
      _ -> mempty
    where
      parseTermsOfService :: A.Value -> T.Parser TermsOfService
      parseTermsOfService = A.withObject "TermsOfService" $ \o -> do
        show_popup_ <- o A..:? "show_popup"
        min_user_age_ <- mconcat [o A..:? "min_user_age", U.rm <$> (o A..: "min_user_age" :: T.Parser String)] :: T.Parser (Maybe Int)
        text_ <- o A..:? "text"
        return $ TermsOfService {show_popup = show_popup_, min_user_age = min_user_age_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON TermsOfService where
  toJSON
    TermsOfService
      { show_popup = show_popup_,
        min_user_age = min_user_age_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "termsOfService",
          "show_popup" A..= show_popup_,
          "min_user_age" A..= min_user_age_,
          "text" A..= text_
        ]
