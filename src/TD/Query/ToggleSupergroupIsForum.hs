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
    { supergroup_id     :: Maybe Int  -- ^ Identifier of the supergroup
    , is_forum          :: Maybe Bool -- ^ New value of is_forum
    , has_forum_tabs    :: Maybe Bool -- ^ New value of has_forum_tabs; ignored if is_forum is false
    , has_forum_sidebar :: Maybe Bool -- ^ New value of has_forum_sidebar; ignored if is_forum is false. Must be false if has_forum_tabs is true
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupIsForum where
  shortShow
    ToggleSupergroupIsForum
      { supergroup_id     = supergroup_id_
      , is_forum          = is_forum_
      , has_forum_tabs    = has_forum_tabs_
      , has_forum_sidebar = has_forum_sidebar_
      }
        = "ToggleSupergroupIsForum"
          ++ I.cc
          [ "supergroup_id"     `I.p` supergroup_id_
          , "is_forum"          `I.p` is_forum_
          , "has_forum_tabs"    `I.p` has_forum_tabs_
          , "has_forum_sidebar" `I.p` has_forum_sidebar_
          ]

instance AT.ToJSON ToggleSupergroupIsForum where
  toJSON
    ToggleSupergroupIsForum
      { supergroup_id     = supergroup_id_
      , is_forum          = is_forum_
      , has_forum_tabs    = has_forum_tabs_
      , has_forum_sidebar = has_forum_sidebar_
      }
        = A.object
          [ "@type"             A..= AT.String "toggleSupergroupIsForum"
          , "supergroup_id"     A..= supergroup_id_
          , "is_forum"          A..= is_forum_
          , "has_forum_tabs"    A..= has_forum_tabs_
          , "has_forum_sidebar" A..= has_forum_sidebar_
          ]

defaultToggleSupergroupIsForum :: ToggleSupergroupIsForum
defaultToggleSupergroupIsForum =
  ToggleSupergroupIsForum
    { supergroup_id     = Nothing
    , is_forum          = Nothing
    , has_forum_tabs    = Nothing
    , has_forum_sidebar = Nothing
    }

