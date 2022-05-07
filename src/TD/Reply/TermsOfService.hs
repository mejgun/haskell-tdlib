{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.TermsOfService where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.FormattedText as FormattedText
import qualified Utils as U

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
      { show_popup = show_popup,
        min_user_age = min_user_age,
        text = text
      } =
      "TermsOfService"
        ++ U.cc
          [ U.p "show_popup" show_popup,
            U.p "min_user_age" min_user_age,
            U.p "text" text
          ]

instance T.FromJSON TermsOfService where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "termsOfService" -> parseTermsOfService v
      _ -> fail ""
    where
      parseTermsOfService :: A.Value -> T.Parser TermsOfService
      parseTermsOfService = A.withObject "TermsOfService" $ \o -> do
        show_popup_ <- o A..:? "show_popup"
        min_user_age_ <- mconcat [o A..:? "min_user_age", U.rm <$> (o A..: "min_user_age" :: T.Parser String)] :: T.Parser (Maybe Int)
        text_ <- o A..:? "text"
        return $ TermsOfService {show_popup = show_popup_, min_user_age = min_user_age_, text = text_}
  parseJSON _ = fail ""

instance T.ToJSON TermsOfService where
  toJSON
    TermsOfService
      { show_popup = show_popup,
        min_user_age = min_user_age,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "termsOfService",
          "show_popup" A..= show_popup,
          "min_user_age" A..= min_user_age,
          "text" A..= text
        ]
