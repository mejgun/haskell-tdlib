module TD.Data.RestrictionInfo
  (RestrictionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data RestrictionInfo
  = RestrictionInfo -- ^ Contains information about restrictions that must be applied to a chat or a message
    { restriction_reason    :: Maybe T.Text -- ^ A human-readable description of the reason why access to the content must be restricted. If empty, then the content can be accessed, but may be covered by hidden with 18+ spoiler anyway
    , has_sensitive_content :: Maybe Bool   -- ^ True, if media content of the messages must be hidden with 18+ spoiler. Use value of the option "can_ignore_sensitive_content_restrictions" to check whether the current user can ignore the restriction. If age verification parameters were received in updateAgeVerificationParameters, then the user must complete age verification to ignore the restriction. Set the option "ignore_sensitive_content_restrictions" to true if the user passes age verification
    }
  deriving (Eq, Show)

instance I.ShortShow RestrictionInfo where
  shortShow RestrictionInfo
    { restriction_reason    = restriction_reason_
    , has_sensitive_content = has_sensitive_content_
    }
      = "RestrictionInfo"
        ++ I.cc
        [ "restriction_reason"    `I.p` restriction_reason_
        , "has_sensitive_content" `I.p` has_sensitive_content_
        ]

instance AT.FromJSON RestrictionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "restrictionInfo" -> parseRestrictionInfo v
      _                 -> mempty
    
    where
      parseRestrictionInfo :: A.Value -> AT.Parser RestrictionInfo
      parseRestrictionInfo = A.withObject "RestrictionInfo" $ \o -> do
        restriction_reason_    <- o A..:?  "restriction_reason"
        has_sensitive_content_ <- o A..:?  "has_sensitive_content"
        pure $ RestrictionInfo
          { restriction_reason    = restriction_reason_
          , has_sensitive_content = has_sensitive_content_
          }
  parseJSON _ = mempty

