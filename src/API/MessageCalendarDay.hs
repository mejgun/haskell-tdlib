-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageCalendarDay where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Message as Message

-- |
-- 
-- Contains information about found messages sent on a specific day 
-- 
-- __total_count__ Total number of found messages sent on the day
-- 
-- __message__ First message sent on the day
data MessageCalendarDay = 

 MessageCalendarDay { message :: Maybe Message.Message, total_count :: Maybe Int }  deriving (Eq)

instance Show MessageCalendarDay where
 show MessageCalendarDay { message=message, total_count=total_count } =
  "MessageCalendarDay" ++ cc [p "message" message, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageCalendarDay where
 toJSON MessageCalendarDay { message = message, total_count = total_count } =
  A.object [ "@type" A..= T.String "messageCalendarDay", "message" A..= message, "total_count" A..= total_count ]

instance T.FromJSON MessageCalendarDay where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageCalendarDay" -> parseMessageCalendarDay v
   _ -> mempty
  where
   parseMessageCalendarDay :: A.Value -> T.Parser MessageCalendarDay
   parseMessageCalendarDay = A.withObject "MessageCalendarDay" $ \o -> do
    message <- o A..:? "message"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageCalendarDay { message = message, total_count = total_count }
 parseJSON _ = mempty
