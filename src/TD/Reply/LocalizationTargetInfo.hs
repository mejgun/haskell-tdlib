{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.LocalizationTargetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.LanguagePackInfo as LanguagePackInfo
import qualified Utils as U

data LocalizationTargetInfo = -- | Contains information about the current localization target @language_packs List of available language packs for this application
  LocalizationTargetInfo
  { -- |
    language_packs :: Maybe [LanguagePackInfo.LanguagePackInfo]
  }
  deriving (Eq)

instance Show LocalizationTargetInfo where
  show
    LocalizationTargetInfo
      { language_packs = language_packs
      } =
      "LocalizationTargetInfo"
        ++ U.cc
          [ U.p "language_packs" language_packs
          ]

instance T.FromJSON LocalizationTargetInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "localizationTargetInfo" -> parseLocalizationTargetInfo v
      _ -> fail ""
    where
      parseLocalizationTargetInfo :: A.Value -> T.Parser LocalizationTargetInfo
      parseLocalizationTargetInfo = A.withObject "LocalizationTargetInfo" $ \o -> do
        language_packs_ <- o A..:? "language_packs"
        return $ LocalizationTargetInfo {language_packs = language_packs_}
  parseJSON _ = fail ""

instance T.ToJSON LocalizationTargetInfo where
  toJSON
    LocalizationTargetInfo
      { language_packs = language_packs
      } =
      A.object
        [ "@type" A..= T.String "localizationTargetInfo",
          "language_packs" A..= language_packs
        ]
