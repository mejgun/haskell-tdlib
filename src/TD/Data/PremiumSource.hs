{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.PremiumLimitType as PremiumLimitType
import qualified TD.Data.PremiumStoryFeature as PremiumStoryFeature
import qualified Utils as U

-- | Describes a source from which the Premium features screen is opened
data PremiumSource
  = -- | A limit was exceeded @limit_type Type of the exceeded limit
    PremiumSourceLimitExceeded
      { -- |
        limit_type :: Maybe PremiumLimitType.PremiumLimitType
      }
  | -- | A user tried to use a Premium feature @feature The used feature
    PremiumSourceFeature
      { -- |
        feature :: Maybe PremiumFeature.PremiumFeature
      }
  | -- | A user tried to use a Premium story feature @feature The used feature
    PremiumSourceStoryFeature
      { -- |
        _feature :: Maybe PremiumStoryFeature.PremiumStoryFeature
      }
  | -- | A user opened an internal link of the type internalLinkTypePremiumFeatures @referrer The referrer from the link
    PremiumSourceLink
      { -- |
        referrer :: Maybe String
      }
  | -- | A user opened the Premium features screen from settings
    PremiumSourceSettings
  deriving (Eq)

instance Show PremiumSource where
  show
    PremiumSourceLimitExceeded
      { limit_type = limit_type_
      } =
      "PremiumSourceLimitExceeded"
        ++ U.cc
          [ U.p "limit_type" limit_type_
          ]
  show
    PremiumSourceFeature
      { feature = feature_
      } =
      "PremiumSourceFeature"
        ++ U.cc
          [ U.p "feature" feature_
          ]
  show
    PremiumSourceStoryFeature
      { _feature = _feature_
      } =
      "PremiumSourceStoryFeature"
        ++ U.cc
          [ U.p "_feature" _feature_
          ]
  show
    PremiumSourceLink
      { referrer = referrer_
      } =
      "PremiumSourceLink"
        ++ U.cc
          [ U.p "referrer" referrer_
          ]
  show PremiumSourceSettings =
    "PremiumSourceSettings"
      ++ U.cc
        []

instance T.FromJSON PremiumSource where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumSourceLimitExceeded" -> parsePremiumSourceLimitExceeded v
      "premiumSourceFeature" -> parsePremiumSourceFeature v
      "premiumSourceStoryFeature" -> parsePremiumSourceStoryFeature v
      "premiumSourceLink" -> parsePremiumSourceLink v
      "premiumSourceSettings" -> parsePremiumSourceSettings v
      _ -> mempty
    where
      parsePremiumSourceLimitExceeded :: A.Value -> T.Parser PremiumSource
      parsePremiumSourceLimitExceeded = A.withObject "PremiumSourceLimitExceeded" $ \o -> do
        limit_type_ <- o A..:? "limit_type"
        return $ PremiumSourceLimitExceeded {limit_type = limit_type_}

      parsePremiumSourceFeature :: A.Value -> T.Parser PremiumSource
      parsePremiumSourceFeature = A.withObject "PremiumSourceFeature" $ \o -> do
        feature_ <- o A..:? "feature"
        return $ PremiumSourceFeature {feature = feature_}

      parsePremiumSourceStoryFeature :: A.Value -> T.Parser PremiumSource
      parsePremiumSourceStoryFeature = A.withObject "PremiumSourceStoryFeature" $ \o -> do
        _feature_ <- o A..:? "feature"
        return $ PremiumSourceStoryFeature {_feature = _feature_}

      parsePremiumSourceLink :: A.Value -> T.Parser PremiumSource
      parsePremiumSourceLink = A.withObject "PremiumSourceLink" $ \o -> do
        referrer_ <- o A..:? "referrer"
        return $ PremiumSourceLink {referrer = referrer_}

      parsePremiumSourceSettings :: A.Value -> T.Parser PremiumSource
      parsePremiumSourceSettings = A.withObject "PremiumSourceSettings" $ \_ -> return PremiumSourceSettings
  parseJSON _ = mempty

instance T.ToJSON PremiumSource where
  toJSON
    PremiumSourceLimitExceeded
      { limit_type = limit_type_
      } =
      A.object
        [ "@type" A..= T.String "premiumSourceLimitExceeded",
          "limit_type" A..= limit_type_
        ]
  toJSON
    PremiumSourceFeature
      { feature = feature_
      } =
      A.object
        [ "@type" A..= T.String "premiumSourceFeature",
          "feature" A..= feature_
        ]
  toJSON
    PremiumSourceStoryFeature
      { _feature = _feature_
      } =
      A.object
        [ "@type" A..= T.String "premiumSourceStoryFeature",
          "feature" A..= _feature_
        ]
  toJSON
    PremiumSourceLink
      { referrer = referrer_
      } =
      A.object
        [ "@type" A..= T.String "premiumSourceLink",
          "referrer" A..= referrer_
        ]
  toJSON PremiumSourceSettings =
    A.object
      [ "@type" A..= T.String "premiumSourceSettings"
      ]
