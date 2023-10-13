module TD.Data.LocalizationTargetInfo
  ( LocalizationTargetInfo(..)    
  , defaultLocalizationTargetInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo

data LocalizationTargetInfo
  = LocalizationTargetInfo -- ^ Contains information about the current localization target
    { language_packs :: Maybe [LanguagePackInfo.LanguagePackInfo] -- ^ List of available language packs for this application
    }
  deriving (Eq)

instance Show LocalizationTargetInfo where
  show LocalizationTargetInfo
    { language_packs = language_packs_
    }
      = "LocalizationTargetInfo"
        ++ I.cc
        [ "language_packs" `I.p` language_packs_
        ]

instance AT.FromJSON LocalizationTargetInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "localizationTargetInfo" -> parseLocalizationTargetInfo v
      _                        -> mempty
    
    where
      parseLocalizationTargetInfo :: A.Value -> AT.Parser LocalizationTargetInfo
      parseLocalizationTargetInfo = A.withObject "LocalizationTargetInfo" $ \o -> do
        language_packs_ <- o A..:?  "language_packs"
        pure $ LocalizationTargetInfo
          { language_packs = language_packs_
          }
  parseJSON _ = mempty

instance AT.ToJSON LocalizationTargetInfo where
  toJSON LocalizationTargetInfo
    { language_packs = language_packs_
    }
      = A.object
        [ "@type"          A..= AT.String "localizationTargetInfo"
        , "language_packs" A..= language_packs_
        ]

defaultLocalizationTargetInfo :: LocalizationTargetInfo
defaultLocalizationTargetInfo =
  LocalizationTargetInfo
    { language_packs = Nothing
    }

