module TD.Query.ToggleSupergroupHasAutomaticTranslation
  (ToggleSupergroupHasAutomaticTranslation(..)
  , defaultToggleSupergroupHasAutomaticTranslation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether messages are automatically translated in the channel chat; requires can_change_info administrator right in the channel. The chat must have at least chatBoostFeatures.min_automatic_translation_boost_level boost level to enable automatic translation. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupHasAutomaticTranslation
  = ToggleSupergroupHasAutomaticTranslation
    { supergroup_id             :: Maybe Int  -- ^ The identifier of the channel
    , has_automatic_translation :: Maybe Bool -- ^ The new value of has_automatic_translation
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupHasAutomaticTranslation where
  shortShow
    ToggleSupergroupHasAutomaticTranslation
      { supergroup_id             = supergroup_id_
      , has_automatic_translation = has_automatic_translation_
      }
        = "ToggleSupergroupHasAutomaticTranslation"
          ++ I.cc
          [ "supergroup_id"             `I.p` supergroup_id_
          , "has_automatic_translation" `I.p` has_automatic_translation_
          ]

instance AT.ToJSON ToggleSupergroupHasAutomaticTranslation where
  toJSON
    ToggleSupergroupHasAutomaticTranslation
      { supergroup_id             = supergroup_id_
      , has_automatic_translation = has_automatic_translation_
      }
        = A.object
          [ "@type"                     A..= AT.String "toggleSupergroupHasAutomaticTranslation"
          , "supergroup_id"             A..= supergroup_id_
          , "has_automatic_translation" A..= has_automatic_translation_
          ]

defaultToggleSupergroupHasAutomaticTranslation :: ToggleSupergroupHasAutomaticTranslation
defaultToggleSupergroupHasAutomaticTranslation =
  ToggleSupergroupHasAutomaticTranslation
    { supergroup_id             = Nothing
    , has_automatic_translation = Nothing
    }

