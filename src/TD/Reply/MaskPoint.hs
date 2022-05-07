{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MaskPoint where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Part of the face, relative to which a mask is placed
data MaskPoint
  = -- | The mask is placed relatively to the forehead
    MaskPointForehead
  | -- | The mask is placed relatively to the eyes
    MaskPointEyes
  | -- | The mask is placed relatively to the mouth
    MaskPointMouth
  | -- | The mask is placed relatively to the chin
    MaskPointChin
  deriving (Eq)

instance Show MaskPoint where
  show MaskPointForehead =
    "MaskPointForehead"
      ++ U.cc
        []
  show MaskPointEyes =
    "MaskPointEyes"
      ++ U.cc
        []
  show MaskPointMouth =
    "MaskPointMouth"
      ++ U.cc
        []
  show MaskPointChin =
    "MaskPointChin"
      ++ U.cc
        []

instance T.FromJSON MaskPoint where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "maskPointForehead" -> parseMaskPointForehead v
      "maskPointEyes" -> parseMaskPointEyes v
      "maskPointMouth" -> parseMaskPointMouth v
      "maskPointChin" -> parseMaskPointChin v
      _ -> fail ""
    where
      parseMaskPointForehead :: A.Value -> T.Parser MaskPoint
      parseMaskPointForehead = A.withObject "MaskPointForehead" $ \o -> do
        return $ MaskPointForehead {}

      parseMaskPointEyes :: A.Value -> T.Parser MaskPoint
      parseMaskPointEyes = A.withObject "MaskPointEyes" $ \o -> do
        return $ MaskPointEyes {}

      parseMaskPointMouth :: A.Value -> T.Parser MaskPoint
      parseMaskPointMouth = A.withObject "MaskPointMouth" $ \o -> do
        return $ MaskPointMouth {}

      parseMaskPointChin :: A.Value -> T.Parser MaskPoint
      parseMaskPointChin = A.withObject "MaskPointChin" $ \o -> do
        return $ MaskPointChin {}
  parseJSON _ = fail ""

instance T.ToJSON MaskPoint where
  toJSON MaskPointForehead =
    A.object
      [ "@type" A..= T.String "maskPointForehead"
      ]
  toJSON MaskPointEyes =
    A.object
      [ "@type" A..= T.String "maskPointEyes"
      ]
  toJSON MaskPointMouth =
    A.object
      [ "@type" A..= T.String "maskPointMouth"
      ]
  toJSON MaskPointChin =
    A.object
      [ "@type" A..= T.String "maskPointChin"
      ]
