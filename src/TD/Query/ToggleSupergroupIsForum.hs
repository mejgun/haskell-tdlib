module TD.Query.ToggleSupergroupIsForum
  (ToggleSupergroupIsForum(..)
  , defaultToggleSupergroupIsForum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion supergroups can't be converted to forums. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupIsForum
  = ToggleSupergroupIsForum
    { supergroup_id :: Maybe Int  -- ^ Identifier of the supergroup
    , is_forum      :: Maybe Bool -- ^ New value of is_forum
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupIsForum where
  shortShow
    ToggleSupergroupIsForum
      { supergroup_id = supergroup_id_
      , is_forum      = is_forum_
      }
        = "ToggleSupergroupIsForum"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "is_forum"      `I.p` is_forum_
          ]

instance AT.ToJSON ToggleSupergroupIsForum where
  toJSON
    ToggleSupergroupIsForum
      { supergroup_id = supergroup_id_
      , is_forum      = is_forum_
      }
        = A.object
          [ "@type"         A..= AT.String "toggleSupergroupIsForum"
          , "supergroup_id" A..= supergroup_id_
          , "is_forum"      A..= is_forum_
          ]

defaultToggleSupergroupIsForum :: ToggleSupergroupIsForum
defaultToggleSupergroupIsForum =
  ToggleSupergroupIsForum
    { supergroup_id = Nothing
    , is_forum      = Nothing
    }

