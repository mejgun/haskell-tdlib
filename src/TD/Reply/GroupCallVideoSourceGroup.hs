{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.GroupCallVideoSourceGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data GroupCallVideoSourceGroup = -- | Describes a group of video synchronization source identifiers @semantics The semantics of sources, one of "SIM" or "FID" @source_ids The list of synchronization source identifiers
  GroupCallVideoSourceGroup
  { -- |
    source_ids :: Maybe [Int],
    -- |
    semantics :: Maybe String
  }
  deriving (Eq)

instance Show GroupCallVideoSourceGroup where
  show
    GroupCallVideoSourceGroup
      { source_ids = source_ids,
        semantics = semantics
      } =
      "GroupCallVideoSourceGroup"
        ++ U.cc
          [ U.p "source_ids" source_ids,
            U.p "semantics" semantics
          ]

instance T.FromJSON GroupCallVideoSourceGroup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallVideoSourceGroup" -> parseGroupCallVideoSourceGroup v
      _ -> fail ""
    where
      parseGroupCallVideoSourceGroup :: A.Value -> T.Parser GroupCallVideoSourceGroup
      parseGroupCallVideoSourceGroup = A.withObject "GroupCallVideoSourceGroup" $ \o -> do
        source_ids_ <- o A..:? "source_ids"
        semantics_ <- o A..:? "semantics"
        return $ GroupCallVideoSourceGroup {source_ids = source_ids_, semantics = semantics_}
  parseJSON _ = fail ""

instance T.ToJSON GroupCallVideoSourceGroup where
  toJSON
    GroupCallVideoSourceGroup
      { source_ids = source_ids,
        semantics = semantics
      } =
      A.object
        [ "@type" A..= T.String "groupCallVideoSourceGroup",
          "source_ids" A..= source_ids,
          "semantics" A..= semantics
        ]
