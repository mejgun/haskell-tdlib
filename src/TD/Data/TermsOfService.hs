module TD.Data.TermsOfService
  (TermsOfService(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data TermsOfService
  = TermsOfService -- ^ Contains Telegram terms of service
    { text         :: Maybe FormattedText.FormattedText -- ^ Text of the terms of service
    , min_user_age :: Maybe Int                         -- ^ The minimum age of a user to be able to accept the terms; 0 if age isn't restricted
    , show_popup   :: Maybe Bool                        -- ^ True, if a blocking popup with terms of service must be shown to the user
    }
  deriving (Eq, Show)

instance I.ShortShow TermsOfService where
  shortShow TermsOfService
    { text         = text_
    , min_user_age = min_user_age_
    , show_popup   = show_popup_
    }
      = "TermsOfService"
        ++ I.cc
        [ "text"         `I.p` text_
        , "min_user_age" `I.p` min_user_age_
        , "show_popup"   `I.p` show_popup_
        ]

instance AT.FromJSON TermsOfService where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "termsOfService" -> parseTermsOfService v
      _                -> mempty
    
    where
      parseTermsOfService :: A.Value -> AT.Parser TermsOfService
      parseTermsOfService = A.withObject "TermsOfService" $ \o -> do
        text_         <- o A..:?  "text"
        min_user_age_ <- o A..:?  "min_user_age"
        show_popup_   <- o A..:?  "show_popup"
        pure $ TermsOfService
          { text         = text_
          , min_user_age = min_user_age_
          , show_popup   = show_popup_
          }
  parseJSON _ = mempty

